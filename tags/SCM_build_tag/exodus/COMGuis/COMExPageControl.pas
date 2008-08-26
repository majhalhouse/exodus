{
    Copyright 2001-2008, Estate of Peter Millard
	
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
unit COMExPageControl;



{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}
{ This is autogenerated code using the COMGuiGenerator. DO NOT MODIFY BY HAND }
{-----------------------------------------------------------------------------}
{-----------------------------------------------------------------------------}


{$WARN SYMBOL_PLATFORM OFF}

interface
uses
    ActiveX,Classes,ComCtrls,COMExFont,COMExPopupMenu,ComObj,Controls,Exodus_TLB,Forms,Graphics,StdCtrls,StdVcl,TntComCtrls,TntMenus;

type
    TExControlPageControl = class(TAutoObject, IExodusControl, IExodusControlPageControl)
    public
        constructor Create(control: TTntPageControl);

    private
        _control: TTntPageControl;

    protected
        function Get_ControlType: ExodusControlTypes; safecall;
        function Get_Name: Widestring; safecall;
        procedure Set_Name(const Value: Widestring); safecall;
        function Get_Tag: Integer; safecall;
        procedure Set_Tag(Value: Integer); safecall;
        function Get_Left: Integer; safecall;
        procedure Set_Left(Value: Integer); safecall;
        function Get_Top: Integer; safecall;
        procedure Set_Top(Value: Integer); safecall;
        function Get_Width: Integer; safecall;
        procedure Set_Width(Value: Integer); safecall;
        function Get_Height: Integer; safecall;
        procedure Set_Height(Value: Integer); safecall;
        function Get_Cursor: Integer; safecall;
        procedure Set_Cursor(Value: Integer); safecall;
        function Get_Hint: Widestring; safecall;
        procedure Set_Hint(const Value: Widestring); safecall;
        function Get_HelpType: Integer; safecall;
        procedure Set_HelpType(Value: Integer); safecall;
        function Get_HelpKeyword: Widestring; safecall;
        procedure Set_HelpKeyword(const Value: Widestring); safecall;
        function Get_HelpContext: Integer; safecall;
        procedure Set_HelpContext(Value: Integer); safecall;
        function Get_Align: Integer; safecall;
        procedure Set_Align(Value: Integer); safecall;
        function Get_BiDiMode: Integer; safecall;
        procedure Set_BiDiMode(Value: Integer); safecall;
        function Get_DockSite: Integer; safecall;
        procedure Set_DockSite(Value: Integer); safecall;
        function Get_DragCursor: Integer; safecall;
        procedure Set_DragCursor(Value: Integer); safecall;
        function Get_DragKind: Integer; safecall;
        procedure Set_DragKind(Value: Integer); safecall;
        function Get_DragMode: Integer; safecall;
        procedure Set_DragMode(Value: Integer); safecall;
        function Get_Enabled: Integer; safecall;
        procedure Set_Enabled(Value: Integer); safecall;
        function Get_Font: IExodusControlFont; safecall;
        function Get_HotTrack: Integer; safecall;
        procedure Set_HotTrack(Value: Integer); safecall;
        function Get_MultiLine: Integer; safecall;
        procedure Set_MultiLine(Value: Integer); safecall;
        function Get_OwnerDraw: Integer; safecall;
        procedure Set_OwnerDraw(Value: Integer); safecall;
        function Get_ParentBiDiMode: Integer; safecall;
        procedure Set_ParentBiDiMode(Value: Integer); safecall;
        function Get_ParentFont: Integer; safecall;
        procedure Set_ParentFont(Value: Integer); safecall;
        function Get_ParentShowHint: Integer; safecall;
        procedure Set_ParentShowHint(Value: Integer); safecall;
        function Get_PopupMenu: IExodusControlPopupMenu; safecall;
        function Get_RaggedRight: Integer; safecall;
        procedure Set_RaggedRight(Value: Integer); safecall;
        function Get_ScrollOpposite: Integer; safecall;
        procedure Set_ScrollOpposite(Value: Integer); safecall;
        function Get_ShowHint: Integer; safecall;
        procedure Set_ShowHint(Value: Integer); safecall;
        function Get_Style: Integer; safecall;
        procedure Set_Style(Value: Integer); safecall;
        function Get_TabHeight: Integer; safecall;
        procedure Set_TabHeight(Value: Integer); safecall;
        function Get_TabIndex: Integer; safecall;
        procedure Set_TabIndex(Value: Integer); safecall;
        function Get_TabOrder: Integer; safecall;
        procedure Set_TabOrder(Value: Integer); safecall;
        function Get_TabPosition: Integer; safecall;
        procedure Set_TabPosition(Value: Integer); safecall;
        function Get_TabStop: Integer; safecall;
        procedure Set_TabStop(Value: Integer); safecall;
        function Get_TabWidth: Integer; safecall;
        procedure Set_TabWidth(Value: Integer); safecall;
        function Get_Visible: Integer; safecall;
        procedure Set_Visible(Value: Integer); safecall;
    end;


{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
implementation


constructor TExControlPageControl.Create(control: TTntPageControl);
begin
     _control := control; 
end;

function TExControlPageControl.Get_ControlType: ExodusControlTypes;
begin
    Result := ExodusControlPageControl;
end;

function TExControlPageControl.Get_Name: Widestring;
begin
      Result := _control.Name;
end;

procedure TExControlPageControl.Set_Name(const Value: Widestring);
begin
      _control.Name := Value;
end;

function TExControlPageControl.Get_Tag: Integer;
begin
      Result := _control.Tag;
end;

procedure TExControlPageControl.Set_Tag(Value: Integer);
begin
      _control.Tag := Value;
end;

function TExControlPageControl.Get_Left: Integer;
begin
      Result := _control.Left;
end;

procedure TExControlPageControl.Set_Left(Value: Integer);
begin
      _control.Left := Value;
end;

function TExControlPageControl.Get_Top: Integer;
begin
      Result := _control.Top;
end;

procedure TExControlPageControl.Set_Top(Value: Integer);
begin
      _control.Top := Value;
end;

function TExControlPageControl.Get_Width: Integer;
begin
      Result := _control.Width;
end;

procedure TExControlPageControl.Set_Width(Value: Integer);
begin
      _control.Width := Value;
end;

function TExControlPageControl.Get_Height: Integer;
begin
      Result := _control.Height;
end;

procedure TExControlPageControl.Set_Height(Value: Integer);
begin
      _control.Height := Value;
end;

function TExControlPageControl.Get_Cursor: Integer;
begin
      Result := _control.Cursor;
end;

procedure TExControlPageControl.Set_Cursor(Value: Integer);
begin
      _control.Cursor := Value;
end;

function TExControlPageControl.Get_Hint: Widestring;
begin
      Result := _control.Hint;
end;

procedure TExControlPageControl.Set_Hint(const Value: Widestring);
begin
      _control.Hint := Value;
end;

function TExControlPageControl.Get_HelpType: Integer;
begin
    if (_control.HelpType = htKeyword) then Result := 0;
    if (_control.HelpType = htContext) then Result := 1;
end;

procedure TExControlPageControl.Set_HelpType(Value: Integer);
begin
   if (Value = 0) then _control.HelpType := htKeyword;
   if (Value = 1) then _control.HelpType := htContext;
end;

function TExControlPageControl.Get_HelpKeyword: Widestring;
begin
      Result := _control.HelpKeyword;
end;

procedure TExControlPageControl.Set_HelpKeyword(const Value: Widestring);
begin
      _control.HelpKeyword := Value;
end;

function TExControlPageControl.Get_HelpContext: Integer;
begin
      Result := _control.HelpContext;
end;

procedure TExControlPageControl.Set_HelpContext(Value: Integer);
begin
      _control.HelpContext := Value;
end;

function TExControlPageControl.Get_Align: Integer;
begin
    if (_control.Align = alNone) then Result := 0;
    if (_control.Align = alTop) then Result := 1;
    if (_control.Align = alBottom) then Result := 2;
    if (_control.Align = alLeft) then Result := 3;
    if (_control.Align = alRight) then Result := 4;
    if (_control.Align = alClient) then Result := 5;
    if (_control.Align = alCustom) then Result := 6;
end;

procedure TExControlPageControl.Set_Align(Value: Integer);
begin
   if (Value = 0) then _control.Align := alNone;
   if (Value = 1) then _control.Align := alTop;
   if (Value = 2) then _control.Align := alBottom;
   if (Value = 3) then _control.Align := alLeft;
   if (Value = 4) then _control.Align := alRight;
   if (Value = 5) then _control.Align := alClient;
   if (Value = 6) then _control.Align := alCustom;
end;

function TExControlPageControl.Get_BiDiMode: Integer;
begin
    if (_control.BiDiMode = bdLeftToRight) then Result := 0;
    if (_control.BiDiMode = bdRightToLeft) then Result := 1;
    if (_control.BiDiMode = bdRightToLeftNoAlign) then Result := 2;
    if (_control.BiDiMode = bdRightToLeftReadingOnly) then Result := 3;
end;

procedure TExControlPageControl.Set_BiDiMode(Value: Integer);
begin
   if (Value = 0) then _control.BiDiMode := bdLeftToRight;
   if (Value = 1) then _control.BiDiMode := bdRightToLeft;
   if (Value = 2) then _control.BiDiMode := bdRightToLeftNoAlign;
   if (Value = 3) then _control.BiDiMode := bdRightToLeftReadingOnly;
end;

function TExControlPageControl.Get_DockSite: Integer;
begin
    if (_control.DockSite = False) then Result := 0;
    if (_control.DockSite = True) then Result := 1;
end;

procedure TExControlPageControl.Set_DockSite(Value: Integer);
begin
   if (Value = 0) then _control.DockSite := False;
   if (Value = 1) then _control.DockSite := True;
end;

function TExControlPageControl.Get_DragCursor: Integer;
begin
      Result := _control.DragCursor;
end;

procedure TExControlPageControl.Set_DragCursor(Value: Integer);
begin
      _control.DragCursor := Value;
end;

function TExControlPageControl.Get_DragKind: Integer;
begin
    if (_control.DragKind = dkDrag) then Result := 0;
    if (_control.DragKind = dkDock) then Result := 1;
end;

procedure TExControlPageControl.Set_DragKind(Value: Integer);
begin
   if (Value = 0) then _control.DragKind := dkDrag;
   if (Value = 1) then _control.DragKind := dkDock;
end;

function TExControlPageControl.Get_DragMode: Integer;
begin
    if (_control.DragMode = dmManual) then Result := 0;
    if (_control.DragMode = dmAutomatic) then Result := 1;
end;

procedure TExControlPageControl.Set_DragMode(Value: Integer);
begin
   if (Value = 0) then _control.DragMode := dmManual;
   if (Value = 1) then _control.DragMode := dmAutomatic;
end;

function TExControlPageControl.Get_Enabled: Integer;
begin
    if (_control.Enabled = False) then Result := 0;
    if (_control.Enabled = True) then Result := 1;
end;

procedure TExControlPageControl.Set_Enabled(Value: Integer);
begin
   if (Value = 0) then _control.Enabled := False;
   if (Value = 1) then _control.Enabled := True;
end;

function TExControlPageControl.Get_Font: IExodusControlFont;
begin
      Result := TExControlFont.Create(TFont(_control.Font));
end;

function TExControlPageControl.Get_HotTrack: Integer;
begin
    if (_control.HotTrack = False) then Result := 0;
    if (_control.HotTrack = True) then Result := 1;
end;

procedure TExControlPageControl.Set_HotTrack(Value: Integer);
begin
   if (Value = 0) then _control.HotTrack := False;
   if (Value = 1) then _control.HotTrack := True;
end;

function TExControlPageControl.Get_MultiLine: Integer;
begin
    if (_control.MultiLine = False) then Result := 0;
    if (_control.MultiLine = True) then Result := 1;
end;

procedure TExControlPageControl.Set_MultiLine(Value: Integer);
begin
   if (Value = 0) then _control.MultiLine := False;
   if (Value = 1) then _control.MultiLine := True;
end;

function TExControlPageControl.Get_OwnerDraw: Integer;
begin
    if (_control.OwnerDraw = False) then Result := 0;
    if (_control.OwnerDraw = True) then Result := 1;
end;

procedure TExControlPageControl.Set_OwnerDraw(Value: Integer);
begin
   if (Value = 0) then _control.OwnerDraw := False;
   if (Value = 1) then _control.OwnerDraw := True;
end;

function TExControlPageControl.Get_ParentBiDiMode: Integer;
begin
    if (_control.ParentBiDiMode = False) then Result := 0;
    if (_control.ParentBiDiMode = True) then Result := 1;
end;

procedure TExControlPageControl.Set_ParentBiDiMode(Value: Integer);
begin
   if (Value = 0) then _control.ParentBiDiMode := False;
   if (Value = 1) then _control.ParentBiDiMode := True;
end;

function TExControlPageControl.Get_ParentFont: Integer;
begin
    if (_control.ParentFont = False) then Result := 0;
    if (_control.ParentFont = True) then Result := 1;
end;

procedure TExControlPageControl.Set_ParentFont(Value: Integer);
begin
   if (Value = 0) then _control.ParentFont := False;
   if (Value = 1) then _control.ParentFont := True;
end;

function TExControlPageControl.Get_ParentShowHint: Integer;
begin
    if (_control.ParentShowHint = False) then Result := 0;
    if (_control.ParentShowHint = True) then Result := 1;
end;

procedure TExControlPageControl.Set_ParentShowHint(Value: Integer);
begin
   if (Value = 0) then _control.ParentShowHint := False;
   if (Value = 1) then _control.ParentShowHint := True;
end;

function TExControlPageControl.Get_PopupMenu: IExodusControlPopupMenu;
begin
      Result := TExControlPopupMenu.Create(TTntPopupMenu(_control.PopupMenu));
end;

function TExControlPageControl.Get_RaggedRight: Integer;
begin
    if (_control.RaggedRight = False) then Result := 0;
    if (_control.RaggedRight = True) then Result := 1;
end;

procedure TExControlPageControl.Set_RaggedRight(Value: Integer);
begin
   if (Value = 0) then _control.RaggedRight := False;
   if (Value = 1) then _control.RaggedRight := True;
end;

function TExControlPageControl.Get_ScrollOpposite: Integer;
begin
    if (_control.ScrollOpposite = False) then Result := 0;
    if (_control.ScrollOpposite = True) then Result := 1;
end;

procedure TExControlPageControl.Set_ScrollOpposite(Value: Integer);
begin
   if (Value = 0) then _control.ScrollOpposite := False;
   if (Value = 1) then _control.ScrollOpposite := True;
end;

function TExControlPageControl.Get_ShowHint: Integer;
begin
    if (_control.ShowHint = False) then Result := 0;
    if (_control.ShowHint = True) then Result := 1;
end;

procedure TExControlPageControl.Set_ShowHint(Value: Integer);
begin
   if (Value = 0) then _control.ShowHint := False;
   if (Value = 1) then _control.ShowHint := True;
end;

function TExControlPageControl.Get_Style: Integer;
begin
    if (_control.Style = tsTabs) then Result := 0;
    if (_control.Style = tsButtons) then Result := 1;
    if (_control.Style = tsFlatButtons) then Result := 2;
end;

procedure TExControlPageControl.Set_Style(Value: Integer);
begin
   if (Value = 0) then _control.Style := tsTabs;
   if (Value = 1) then _control.Style := tsButtons;
   if (Value = 2) then _control.Style := tsFlatButtons;
end;

function TExControlPageControl.Get_TabHeight: Integer;
begin
      Result := _control.TabHeight;
end;

procedure TExControlPageControl.Set_TabHeight(Value: Integer);
begin
      _control.TabHeight := Value;
end;

function TExControlPageControl.Get_TabIndex: Integer;
begin
      Result := _control.TabIndex;
end;

procedure TExControlPageControl.Set_TabIndex(Value: Integer);
begin
      _control.TabIndex := Value;
end;

function TExControlPageControl.Get_TabOrder: Integer;
begin
      Result := _control.TabOrder;
end;

procedure TExControlPageControl.Set_TabOrder(Value: Integer);
begin
      _control.TabOrder := Value;
end;

function TExControlPageControl.Get_TabPosition: Integer;
begin
    if (_control.TabPosition = tpTop) then Result := 0;
    if (_control.TabPosition = tpBottom) then Result := 1;
    if (_control.TabPosition = tpLeft) then Result := 2;
    if (_control.TabPosition = tpRight) then Result := 3;
end;

procedure TExControlPageControl.Set_TabPosition(Value: Integer);
begin
   if (Value = 0) then _control.TabPosition := tpTop;
   if (Value = 1) then _control.TabPosition := tpBottom;
   if (Value = 2) then _control.TabPosition := tpLeft;
   if (Value = 3) then _control.TabPosition := tpRight;
end;

function TExControlPageControl.Get_TabStop: Integer;
begin
    if (_control.TabStop = False) then Result := 0;
    if (_control.TabStop = True) then Result := 1;
end;

procedure TExControlPageControl.Set_TabStop(Value: Integer);
begin
   if (Value = 0) then _control.TabStop := False;
   if (Value = 1) then _control.TabStop := True;
end;

function TExControlPageControl.Get_TabWidth: Integer;
begin
      Result := _control.TabWidth;
end;

procedure TExControlPageControl.Set_TabWidth(Value: Integer);
begin
      _control.TabWidth := Value;
end;

function TExControlPageControl.Get_Visible: Integer;
begin
    if (_control.Visible = False) then Result := 0;
    if (_control.Visible = True) then Result := 1;
end;

procedure TExControlPageControl.Set_Visible(Value: Integer);
begin
   if (Value = 0) then _control.Visible := False;
   if (Value = 1) then _control.Visible := True;
end;




end.
