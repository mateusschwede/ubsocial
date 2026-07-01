unit uMod2Ex2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblResposta: TLabel;
    edtTexto: TEdit;
    btnSalvar: TButton;
    procedure bntSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.bntSalvarClick(Sender: TObject);
begin
  lblResposta.Caption := edtTexto.Text;
  edtTexto.Clear;
end;

end.
