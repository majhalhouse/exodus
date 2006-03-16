unit RosterImages;
{
    Copyright 2006, Peter Millard

    This file is part of Exodus.

    Exodus is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Exodus is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Exodus; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

interface
uses
    Unicode,
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ComCtrls, ExtCtrls, Buttons, ImgList, Menus, StdCtrls;

type

    TRosterImages = class
    private
        _imglist: TImageList;
        _ids: TWidestringlist;
        _tmp_bmp: TBitmap;

        //function findHandle(handle: HBitmap): integer;

    public
        constructor Create();
        destructor Destroy(); override;

        procedure Clear();
        procedure setImagelist(images: TImagelist);
        function  AddImage(id: Widestring; Image: TBitmap): integer;
        procedure Remove(ImageIndex: integer); overload;
        procedure Remove(id: Widestring); overload;
        function  Find(id: Widestring): integer;
        function  GetID(index: integer): Widestring;

        procedure GetImage(index: integer; img: TImage);
        procedure GetIcon(index: integer; icon: TIcon);

        property ImageList: TImageList read _imglist;
    end;

var
    RosterTreeImages: TRosterImages;

implementation
{$ifdef Exodus}
uses
    Jabber1;
{$endif}


{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
constructor TRosterImages.Create();
begin
    inherited Create;
    _tmp_bmp := TBitmap.Create();
    _ids := TWidestringlist.Create();    
end;

{---------------------------------------}
procedure TRosterImages.Clear();
begin
    _ids.Clear();
    _imglist := nil;
end;

{---------------------------------------}
procedure TRosterImages.setImagelist(images: TImagelist);
begin
    _imglist := images;

    {$ifdef Exodus}
    _ids.Add('offline');            // 0
    _ids.Add('available');
    _ids.Add('away');
    _ids.Add('dnd');
    _ids.Add('chat');
    _ids.Add('full_folder');
    _ids.Add('unknown');
    _ids.Add('multiple');
    _ids.Add('closed_folder');
    _ids.Add('open_folder');
    _ids.Add('xa');
    _ids.Add('headline');
    _ids.Add('info');
    _ids.Add('book');
    _ids.Add('reply');
    _ids.Add('note');
    _ids.Add('key_old');
    _ids.Add('flowchart');
    _ids.Add('newsitem');
    _ids.Add('image');
    _ids.Add('contact');
    _ids.Add('conference');
    _ids.Add('service');
    _ids.Add('newitem');
    _ids.Add('key');
    _ids.Add('filter');
    _ids.Add('contact_folder');
    _ids.Add('open_group');
    _ids.Add('closed_group');
    _ids.Add('right');
    _ids.Add('left');
    _ids.Add('warn');
    _ids.Add('error');
    _ids.Add('offline_attn');
    _ids.Add('available_attn');
    _ids.Add('away_attn');
    _ids.Add('dnd_attn');
    _ids.Add('chat_attn');
    _ids.Add('xa_attn');
    _ids.Add('online_blocked');
    _ids.Add('delete');
    _ids.Add('offline_blocked');
    _ids.Add('attn');
    _ids.Add('exodus');
    _ids.Add('avail_neg');
    _ids.Add('away_neg');
    _ids.Add('dnd_neg');
    _ids.Add('chat_neg');
    _ids.Add('xa_neg');
    _ids.Add('network');
    _ids.Add('network_disabled');
    _ids.Add('addcontact');
    _ids.Add('addcontact_disabled');
    _ids.Add('delcontact');
    _ids.Add('delcontact_disabled');
    _ids.Add('showonline');
    _ids.Add('showonline_disabled');
    _ids.Add('right_arrow');
    _ids.Add('left_arrow');
    _ids.Add('joinroom');
    _ids.Add('joinroom_disabled');
    _ids.Add('edit');
    _ids.Add('edit_disabled');
    _ids.Add('trash');
    _ids.Add('trash_disabled');
    _ids.Add('search');
    _ids.Add('search_disabled');
    _ids.Add('browser');
    _ids.Add('browser_disabled');
    {$endif}
end;

{---------------------------------------}
destructor TRosterImages.Destroy();
begin
    _tmp_bmp.Free();
    _ids.Free();
    inherited Destroy;
end;

{---------------------------------------}
function TRosterImages.AddImage(id: Widestring; Image: TBitmap): integer;
var
    i: integer;
begin
    if (_imglist = nil) then begin
        Result := -1;
        exit;
    end;
    
    i := _ids.IndexOf(id);
    if (i = -1) then begin
        // add the image
        _ids.Add(id);
        Result := _imglist.Add(Image, nil);
    end
    else
        Result := i;
end;

{---------------------------------------}
procedure TRosterImages.Remove(ImageIndex: integer);
begin
    if (_imglist = nil) then begin
        exit;
    end;

    if (ImageIndex < _imglist.Count) then begin
        _imglist.Delete(ImageIndex);
        _ids.Delete(ImageIndex);
    end;
end;

{---------------------------------------}
procedure TRosterImages.Remove(id: Widestring);
var
    i: integer;
begin
    i := _ids.IndexOf(id);
    if (i >= 0) then
        Remove(i);
end;

{---------------------------------------}
{
function TRosterImages.findHandle(handle: HBitmap): integer;
var
    i: integer;
begin
    // find this hbitmap in the list
    for i := 0 to _imglist.Count - 1 do begin
        _imglist.GetBitmap(i, _tmp_bmp);
        if (_tmp_bmp.Handle = handle) then begin
            Result := i;
            exit;
        end;
    end;
    Result := -1;
end;
}

{---------------------------------------}
function TRosterImages.Find(id: Widestring): integer;
begin
    Result := _ids.IndexOf(id);
end;

{---------------------------------------}
function TRosterImages.GetID(index: integer): Widestring;
begin
    if (index >= 0) and (index < _ids.Count) then
        Result := _ids[index]
    else
        Result := '';
end;

{---------------------------------------}
procedure TRosterImages.GetIcon(index: integer; icon: TIcon);
begin
    if (_imglist = nil) then begin
        exit;
    end;

    _imglist.GetIcon(index, icon);
end;

{---------------------------------------}
procedure TRosterImages.GetImage(index: integer; img: TImage);
begin
    if (_imglist = nil) then exit;
    _imglist.GetBitmap(index, img.Picture.Bitmap);
end;

initialization
    RosterTreeImages := TRosterImages.Create();

finalization
    RosterTreeImages.Free();

end.
