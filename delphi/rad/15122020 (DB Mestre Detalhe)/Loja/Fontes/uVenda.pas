unit uVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDM,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TfrmVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    DBNavigator1: TDBNavigator;
    btInserir: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btCancelar: TBitBtn;
    btConfirmar: TBitBtn;
    DBGrid1: TDBGrid;
    DBNavigator2: TDBNavigator;
    DateTimePicker1: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DateTimePicker1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;

implementation

{$R *.dfm}

procedure TfrmVenda.DateTimePicker1Click(Sender: TObject);
begin
     dbedit2.Text := DateToStr(DateTimePicker1.Date);
end;

procedure TfrmVenda.FormActivate(Sender: TObject);
begin
     dm.tbClientes.Open;
     dm.tbVendedores.Open;
     dm.tbVendas.Open;
     dm.tbItens.Open;
end;

procedure TfrmVenda.FormDeactivate(Sender: TObject);
begin
     dm.tbClientes.Close;
     dm.tbVendedores.Close;
     dm.tbVendas.Close;
     dm.tbItens.Close;
end;

end.
