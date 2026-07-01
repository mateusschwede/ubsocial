unit uMod2Ex1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    cbxCheck: TCheckBox;
    btnCheck: TButton;
    btnUncheck: TButton;
    procedure btnCheckClick(Sender: TObject);
    procedure btnUncheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCheckClick(Sender: TObject);
begin
  cbxCheck.Checked := True;
end;

procedure TForm1.btnUncheckClick(Sender: TObject);
begin
  cbxCheck.Checked := False;
end;

end.
