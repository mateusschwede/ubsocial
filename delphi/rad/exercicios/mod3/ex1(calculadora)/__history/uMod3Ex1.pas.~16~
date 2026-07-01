unit uMod3Ex1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtVal1: TEdit;
    edtVal2: TEdit;
    lblRes: TLabel;
    btnSoma: TButton;
    btnResto: TButton;
    btnMult: TButton;
    btnDiv: TButton;
    procedure clickBtnSoma(Sender: TObject);
    procedure clickBtnResto(Sender: TObject);
    procedure clickBtnMult(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDivClick(Sender: TObject);
begin
  lblRes.Caption := FloatToStr((StrToFloat(edtVal1.Text)) / (StrToFloat(edtVal2.Text)));
end;

procedure TForm1.clickBtnMult(Sender: TObject);
begin
  lblRes.Caption := FloatToStr((StrToFloat(edtVal1.Text)) * (StrToFloat(edtVal2.Text)));
end;

procedure TForm1.clickBtnResto(Sender: TObject);
begin
  lblRes.Caption := FloatToStr((StrToFloat(edtVal1.Text)) - (StrToFloat(edtVal2.Text)));
end;

procedure TForm1.clickBtnSoma(Sender: TObject);
begin
  lblRes.Caption := FloatToStr((StrToFloat(edtVal1.Text)) + (StrToFloat(edtVal2.Text)));
end;

end.
