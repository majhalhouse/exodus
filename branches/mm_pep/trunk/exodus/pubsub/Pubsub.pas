unit Pubsub;

interface

uses ActiveX, Classes, ComObj, Exodus_TLB, Unicode, XMLTag;

type
  TExodusPubsubService = class(TAutoIntfObject, IExodusPubsubService)
  private
    _jid: Widestring;

  protected
    function Get_Jid(): Widestring; safecall;

  public
    constructor Create(jid: Widestring);
    destructor Destroy(); override;

    procedure publish(const node: Widestring; var items: OleVariant); safecall;
  end;

  TPubsubListenerSet = class
  private
    _node: Widestring;
    _listeners: TInterfaceList;

    function _ListenerCount(): Integer;
  public
    constructor Create(node: Widestring);
    destructor Destroy(); override;

    procedure Notify(from, node: Widestring; items: OleVariant);
    procedure Add(listener: IExodusPubsubListener);
    procedure Remove(listener: IExodusPubsubListener);

    property Count: Integer read _ListenerCount;
  end;

  TExodusPubsubController = class(TAutoIntfObject, IExodusPubsubController)
  private
    _js: TObject;
    _msgCB: Integer;
    _sessionCB: Integer;
    _depCB: Integer;

    _subscribs: TWidestringList;
    _svcs: TWidestringList;

  protected
    procedure MessageCallback(event: string; tag: TXMLTag);
    procedure SessionCallback(event: string; tag: TXMLTag);

    function Get_PubsubListenerSet(node: Widestring): TPubsubListenerSet;

    function Get_ServiceCount(): Integer; safecall;
    function Get_Service(idx: Integer): IExodusPubsubService; safecall;

  public
    constructor Create(js: TObject);
    destructor Destroy(); override;

    procedure subscribe(const node: Widestring; const callback: IExodusPubsubListener); safecall;
    procedure unsubscribe(const node: Widestring; const callback: IExodusPubsubListener); safecall;

    function ServiceFor(jid: Widestring): IExodusPubsubService;

    property ServiceCount: Integer read Get_ServiceCount;
    property Services[Index: Integer]: IExodusPubsubService read Get_Service;
  end;

implementation

uses ComServ, IQ, JabberID, Variants, Session, SysUtils, XMLParser, Entity, EntityCache;


type TPubsubServiceWrapper = class
private
    _svc: IExodusPubsubService;

public
    constructor Create(svc: IExodusPubsubService);
    destructor Destroy(); override;

    property Service: IExodusPubsubService read _svc;
end;

constructor TPubsubServiceWrapper.Create(svc: IExodusPubsubService);
begin
    _svc := svc;
end;
destructor TPubsubServiceWrapper.Destroy();
begin
    _svc := nil;
    
    inherited;
end;


constructor TExodusPubsubService.Create(jid: WideString);
begin
    inherited Create(ComServer.TypeLib, IID_IExodusPubsubService);

    _jid := jid;
end;
destructor TExodusPubsubService.Destroy;
begin

    inherited;
end;

function TExodusPubsubService.Get_Jid(): Widestring;
begin
    Result := _jid;
end;

procedure TExodusPubsubService.publish(
        const node: WideString;
        var items: OleVariant);
var
    iq: TJabberIQ;
    pub, item: TXMLTag;
    parser: TXMLTagParser;
    val: Widestring;
    idx: Integer;
begin
    //TODO:  stuff!!
    iq := TJabberIQ.Create(MainSession, MainSession.generateID);
    iq.iqType := 'set';
    if (Get_Jid() <> '') then
        iq.toJid := Get_Jid();

    iq.RemoveTag(iq.qTag);
    pub := iq.AddTagNS('pubsub', 'http://jabber.org/protocol/pubsub');
    pub := pub.AddTag('publish');
    pub.setAttribute('node', node);

    parser := TXMLTagParser.Create();
    for idx := VarArrayLowBound(items, 1) to VarArrayHighBound(items, 1) do begin
        val := items[idx];

        parser.ParseString(val);
        if (parser.Count = 0) then continue;
        item := parser.popTag();
        pub.addInsertedXML(item.XML);
        item.Free();
        parser.Clear();
    end;

    iq.Send();
end;

constructor TPubsubListenerSet.Create(node: Widestring);
begin
    _node := node;
    _listeners := TInterfaceList.Create();
end;
destructor TPubsubListenerSet.Destroy;
begin
    FreeAndNil(_listeners);

    inherited;
end;

function TPubsubListenerSet._ListenerCount(): Integer;
begin
    Result := _listeners.Count;
end;

procedure TPubsubListenerSet.Notify(from, node: Widestring; items: OleVariant);
var
    idx: Integer;
begin
    for idx := 0 to _listeners.Count - 1 do begin
        try
            IExodusPubsubListener(_listeners[idx]).OnNotify(from, node, items);
        except
            //TODO: loggit
        end;
    end;
end;
procedure TPubsubListenerSet.Add(listener: IExodusPubsubListener);
begin
    if _listeners.IndexOf(listener) = -1 then
        _listeners.Add(listener);
end;
procedure TPubsubListenerSet.Remove(listener: IExodusPubsubListener);
begin
    _listeners.Remove(listener);
end;


constructor TExodusPubsubController.Create(js: TObject);
var
    session: TJabberSession;
begin
    assert(js is TJabberSession);

    inherited Create(ComServer.TypeLib, IID_IExodusPubsubController);

    session := TJabberSession(js);
    _js := js;
    _subscribs := TWidestringList.Create();
    _svcs := TWidestringList.Create();

    _msgCB := session.RegisterCallback(
            MessageCallback,
            '/post/message/event[@xmlns="http://jabber.org/protocol/pubsub#event"]');
    _sessionCB := session.RegisterCallback(
            SessionCallback,
            '/session/disconnected');
    _depCB := session.RegisterCallback(
            SessionCallback,
            '/dependancy/ready');
end;
destructor TExodusPubsubController.Destroy;
var
    session: TJabberSession;
begin
    session := TJabberSession(_js);
    if (_msgCB <> -1) then
        session.UnRegisterCallback(_msgCB);
    _msgCB := -1;
    if (_sessionCB <> -1) then
        session.UnRegisterCallback(_sessionCB);
    _sessionCB := -1;
    if (_depCB <> -1) then
        session.UnRegisterCallback(_depCB);
    _depCB := -1;

    while (_svcs.Count > 0) do begin
        _svcs.Objects[0].Free();
        _svcs.Delete(0);
    end;
    FreeAndNil(_svcs);
    
    while (_subscribs.Count > 0) do begin
        _subscribs.Objects[0].Free();
        _subscribs.Delete(0);
    end;
    FreeAndNil(_subscribs);

    inherited;
end;

procedure TExodusPubsubController.SessionCallback(event: string; tag: TXMLTag);
var
    jid: Widestring;
    pubsubs: TWidestringList;
    svc: IExodusPubsubService;
begin
    if (event = ('/dependancy/ready/' + DEPMOD_ENTITY_CACHE)) then begin
        //check for PEP
        pubsubs := TWidestringList.Create();
        jid := TJabberSession(_js).SessionJid.jid;
        jEntityCache.getByIdentity('pubsub', 'pep', pubsubs);
        while (pubsubs.Count > 0) do begin
            jid := pubsubs[0];
            pubsubs.Delete(0);

            svc := TExodusPubsubService.Create(jid) as IExodusPubsubService;
            _svcs.AddObject(jid, TPubsubServiceWrapper.Create(svc));
        end;

        //check for "stand-alone"
        jEntityCache.getByIdentity('pubsub', 'service', pubsubs);
        while (pubsubs.Count > 0) do begin
            jid := pubsubs[0];
            pubsubs.Delete(0);
            if not jEntityCache.getByJid(jid).hasFeature('http://jabber.org/protocol/pubsub') then continue;

            svc := TExodusPubsubService.Create(jid) as IExodusPubsubService;
            _svcs.AddObject(jid, TPubsubServiceWrapper.Create(svc));
        end;

        //TODO:  fire events?
    end
    else if (event = '/session/disconnected') then begin
        while (_svcs.Count > 0) do begin
            _svcs.Objects[0].Free();
            _svcs.Delete(0);
        end;
    end;
end;
procedure TExodusPubsubController.MessageCallback(event: string; tag: TXMLTag);
var
    from, node: Widestring;
    evt: TXMLTag;
    idx: Integer;
    itemTags: TXMLTagList;
    items: Variant;
    nodeList, defList: TPubsubListenerSet;
begin
    evt := tag.QueryXPTag('//event[@xmlns="http://jabber.org/protocol/pubsub#event"]/items');

    from := tag.GetAttribute('from');
    node := evt.GetAttribute('node');

    nodeList := Get_PubsubListenerSet(node);
    defList := Get_PubsubListenerSet('');
    if (nodeList = nil) and (defList = nil) then exit;

    items := VarArrayCreate([0, itemTags.Count], varOleStr);
    itemTags := evt.QueryTags('item');
    for idx := 0 to itemTags.Count - 1 do begin
        VarArrayPut(items, itemTags[idx].XML, idx);
    end;

    if (nodeList <> nil) then
        nodeList.Notify(from, node, items);
    if (defList <> nil) then
        defList.Notify(from, node, items);
        
    VarClear(items);
end;

function TExodusPubsubController.Get_ServiceCount(): Integer;
begin
    Result := _svcs.Count;
end;
function TExodusPubsubController.Get_Service(idx: Integer): IExodusPubsubService;
begin
    if (idx < 0) or (idx >= _svcs.Count) then
        result := nil
    else
        Result := TPubsubServiceWrapper(_svcs.Objects[idx]).Service;
end;
function TExodusPubsubController.ServiceFor(jid: WideString): IExodusPubsubService;
begin
    Result := Get_Service(_svcs.IndexOf(jid));
end;

function TExodusPubsubController.Get_PubsubListenerSet(node: WideString): TPubsubListenerSet;
var
    idx: Integer;
begin
    result := nil;
    idx := _subscribs.IndexOf(node);
    if (idx <> -1) then result := TPubsubListenerSet(_subscribs.Objects[idx]);
end;

procedure TExodusPubsubController.subscribe(
        const node: WideString;
        const callback: IExodusPubsubListener);
var
    idx: Integer;
    registered: TPubsubListenerSet;
begin
    if (node = '') then exit;
    if (callback = nil) then exit;

    idx := _subscribs.IndexOf(node);
    if (idx = -1) then begin
        idx := _subscribs.Count;
        _subscribs.AddObject(node, TPubsubListenerSet.Create(node));
    end;
    registered := TPubsubListenerSet(_subscribs.Objects[idx]);
    registered.Add(callback);
end;
procedure TExodusPubsubController.unsubscribe(
        const node: WideString;
        const callback: IExodusPubsubListener);
var
    idx: Integer;
    registered: TPubsubListenerSet;
begin
    if (node = '') then exit;
    if (callback = nil) then exit;

    idx := _subscribs.IndexOf(node);
    if (idx = -1) then exit;

    registered := TPubsubListenerSet(_subscribs.Objects[idx]);
    registered.Remove(callback);
    if (registered.Count = 0) then begin
        _subscribs.Delete(idx);
        FreeAndNil(registered);
    end;
end;

end.
