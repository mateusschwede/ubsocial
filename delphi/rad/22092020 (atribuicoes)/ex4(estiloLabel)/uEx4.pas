unit uEx4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblTexto: TLabel;
    btnFundo: TButton;
    btnCor: TButton;
    btnFonte: TButton;
    btnTamanho: TButton;
    procedure btnFundoClick(Sender: TObject);
    procedure btnCorClick(Sender: TObject);
    procedure btnTamanhoClick(Sender: TObject);
    procedure btnFonteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCorClick(Sender: TObject);
begin
  lblTexto.Font.Color := clYellow;
end;

procedure TForm1.btnFonteClick(Sender: TObject);
begin
  lblTexto.Font.Name := 'Arial';
end;

procedure TForm1.btnFundoClick(Sender: TObject);
begin
  lblTexto.Color := clRed;
end;

procedure TForm1.btnTamanhoClick(Sender: TObject);
begin
  lblTexto.Font.Size := 12;
end;

end.
