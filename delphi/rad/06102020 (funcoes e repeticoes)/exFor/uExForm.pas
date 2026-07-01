unit uExForm;

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
var c,n: Integer;
begin
  n := 0;

  //for cont := num downto 1 do
  for c := 1 to StrToInt(edtVal.Text) do
  begin
    lblRes.Caption := lblRes.Caption + ' ' + (IntToStr(n+1));
    n := n+1;
  end;

end;

end.
