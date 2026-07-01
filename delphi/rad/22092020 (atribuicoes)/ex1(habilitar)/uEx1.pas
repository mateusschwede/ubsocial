unit uEx1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnHabilita: TButton;
    lblTexto: TLabel;
    btnDesabilita: TButton;
    procedure clickBtnHabilita(Sender: TObject);
    procedure clickBtnDesabilita(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.clickBtnDesabilita(Sender: TObject);
begin
  lblTexto.Visible := False;
end;

procedure TForm1.clickBtnHabilita(Sender: TObject);
begin
  lblTexto.Visible := True;
end;

end.
