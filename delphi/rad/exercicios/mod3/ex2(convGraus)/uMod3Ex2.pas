unit uMod3Ex2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMod3Ex1 = class(TForm)
    edtGraus: TEdit;
    btnConverter: TButton;
    lblResultado: TLabel;
    procedure btnConverterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Mod3Ex1: TMod3Ex1;

implementation

{$R *.dfm}

procedure TMod3Ex1.btnConverterClick(Sender: TObject);
begin
  lblResultado.Caption := FloatToStr(((9/5)*(StrToFloat(edtGraus.Text))+32)) + '°F';
  //((Tf=9/5*Tc)+32)
end;

end.
