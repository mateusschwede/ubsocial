unit uAtivTabuada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtVal: TEdit;
    btnExec: TButton;
    memRes: TMemo;
    procedure btnExecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExecClick(Sender: TObject);
var i: Integer;
begin
  memRes.Clear;
  for i := 0 to 10 do
  begin
    memRes.Lines.Add(edtVal.Text + 'X' + IntToStr(i) + ' = ' + IntToStr(StrToInt(edtVal.Text)*i));
  end;

end;

end.
