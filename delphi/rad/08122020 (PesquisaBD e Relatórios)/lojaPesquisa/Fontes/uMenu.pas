unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    abelas1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Vendedores1: TMenuItem;
    Produtos1: TMenuItem;
    Pesquisas1: TMenuItem;
    Consultar1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uClientes, uFornec, uVend, uProd, uConsulta;

procedure TForm1.Clientes1Click(Sender: TObject);
begin
  frmClientes.ShowModal;
end;

procedure TForm1.Consultar1Click(Sender: TObject);
begin
  frmConsulta.ShowModal;
end;

procedure TForm1.Fornecedores1Click(Sender: TObject);
begin
  frmFornec.ShowModal;
end;

procedure TForm1.Produtos1Click(Sender: TObject);
begin
  frmProd.ShowModal;
end;

procedure TForm1.Vendedores1Click(Sender: TObject);
begin
  frmVend.ShowModal;
end;

end.
