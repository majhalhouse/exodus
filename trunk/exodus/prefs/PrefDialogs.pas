unit PrefDialogs;
{
    Copyright 2003, Peter Millard

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
    Menus,
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, PrefPanel, ComCtrls, StdCtrls, jpeg, ExtCtrls, TntStdCtrls,
    TntComCtrls, TntExtCtrls, ExNumericEdit;

type
  TfrmPrefDialogs = class(TfrmPrefPanel)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadPrefs(); override;
    procedure SavePrefs(); override;
  end;

var
  frmPrefDialogs: TfrmPrefDialogs;

implementation
{$R *.dfm}
uses
    Session, XMLUtils;

procedure TfrmPrefDialogs.LoadPrefs();
begin
    //
    inherited;
end;

procedure TfrmPrefDialogs.SavePrefs();
begin
    inherited;
end;
    

end.
