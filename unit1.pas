unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons,
  LclType, ShellApi; //include this units (LclType and ShellApi)!!

type

  { TForm1 }

  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    function RunAsAdmin(const Handle1: Hwnd; const Path, Params: string): Boolean;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


{ TForm1 }

function TForm1.RunAsAdmin(const Handle1: Hwnd; const Path, Params: string): Boolean;
var
  sei: TShellExecuteInfoA;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.Wnd := Handle;
  sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
  sei.lpVerb := 'runas';
  sei.lpFile := PAnsiChar(Path);
  sei.lpParameters := PAnsiChar(Params);
  sei.nShow := SW_SHOWNORMAL;
  Result := ShellExecuteExA(@sei);
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  RunAsAdmin(Handle, 'c:\Windows\system32\cmd.exe', '');
end;

end.

