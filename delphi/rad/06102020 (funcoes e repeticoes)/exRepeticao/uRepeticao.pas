unit uRepeticao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnWhile: TButton;
    BtnRepeat: TButton;
    edtVal: TEdit;
    lblRes: TLabel;
    procedure btnWhileClick(Sender: TObject);
    procedure BtnRepeatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnRepeatClick(Sender: TObject);
var v: Integer;
begin
  v := StrToInt(edtVal.Text);
  //REPEAT 1º faz depois verifica
  repeat
  begin
    lblRes.Caption := lblRes.Caption + ' ' + IntToStr(v+1);
    inc(v);
  end;
  until (v>9);
end;

procedure TForm1.btnWhileClick(Sender: TObject);
var v: Integer;
begin
  v := StrToInt(edtVal.Text);
  //WHILE 1º verifica depois faz
  while (v)<10 do
  begin
    lblRes.Caption := lblRes.Caption + ' ' + IntToStr(v+1);
    inc(v);
  end;

end;

end.
