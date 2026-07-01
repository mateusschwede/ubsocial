unit uMod2Ex3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblCor: TLabel;
    btnVermelho: TButton;
    btnAmarelo: TButton;
    btnVerde: TButton;
    procedure btnVermelhoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnVermelhoClick(Sender: TObject);
begin
  lblCor.Caption := 'Vermelho';
  lblCor.Color := clRed;
end;

end.
