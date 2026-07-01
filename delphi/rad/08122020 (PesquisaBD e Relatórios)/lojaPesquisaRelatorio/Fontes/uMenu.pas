unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    abelas1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Vendedores1: TMenuItem;
    Produtos1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    lbDTHR: TLabel;
    Timer1: TTimer;
    Consulta1: TMenuItem;
    Relatrios1: TMenuItem;
    Produtos2: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uClientes, uFornec, uProd, uConsulta, uRelProd;

procedure TfrmMenu.Clientes1Click(Sender: TObject);
begin
     frmClientes.ShowModal;
end;

procedure TfrmMenu.Consulta1Click(Sender: TObject);
begin
     frmPesquisar.ShowModal;
end;

procedure TfrmMenu.Fornecedores1Click(Sender: TObject);
begin
     frmFornec.ShowModal;
end;

procedure TfrmMenu.Produtos1Click(Sender: TObject);
begin
     frmProd.ShowModal;
end;

procedure TfrmMenu.Produtos2Click(Sender: TObject);
begin
     //frmRelProd.ShowModal;
     frmRelProd.rlRel.Preview;
end;

procedure TfrmMenu.Timer1Timer(Sender: TObject);
begin
     lbDTHR.Caption := DateToStr(Date) + ' - ' + TimeToStr(Time);
end;

end.
