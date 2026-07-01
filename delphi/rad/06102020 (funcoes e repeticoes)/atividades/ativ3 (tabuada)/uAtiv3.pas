unit uAtiv3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtVal: TEdit;
    btnCalc: TButton;
    lblRes: TLabel;
    procedure btnCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcClick(Sender: TObject);
var x,i: Integer;
begin
  lblRes.Caption := 'Resposta';
  x := StrToInt(edtVal.Text);
  for i := 0 to 10 do
  begin
    lblRes.Caption := lblRes.Caption + ' ' + IntToStr(x) + 'X' + IntToStr(i) + '=' + IntToStr(x*i) + ' ';
  end;

end;

end.
