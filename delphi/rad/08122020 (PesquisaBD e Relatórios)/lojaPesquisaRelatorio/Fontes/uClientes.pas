unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, Vcl.Buttons,
  cxTextEdit, cxDBEdit;

type
  TfrmClientes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Panel2: TPanel;
    btInserir: TBitBtn;
    DBNavigator1: TDBNavigator;
    btExcluir: TBitBtn;
    btEditar: TBitBtn;
    btCancelar: TBitBtn;
    btConfirmar: TBitBtn;
    btSair: TBitBtn;
    DBText1: TDBText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btInserirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
    Procedure TrataBotoes;
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

procedure TfrmClientes.btCancelarClick(Sender: TObject);
begin
     dm.tbClientes.Cancel;
     TrataBotoes;
end;

procedure TfrmClientes.btConfirmarClick(Sender: TObject);
begin
     // Regras de validação
     if dm.tbClientes.FieldByName('DCCLIENTE').AsString = '' then
     begin
          MessageDlg('Falta digitar o nome do cliente',
                     mtWarning, [mbOk], 0);
          cxDBTextEdit1.SetFocus;
          Exit;
     end;

     dm.tbClientes.Post;
     TrataBotoes;
end;

procedure TfrmClientes.btEditarClick(Sender: TObject);
begin
     TrataBotoes;
     dm.tbClientes.Edit;
end;

procedure TfrmClientes.btExcluirClick(Sender: TObject);
begin
     if MessageDlg('Deseja realmente excluir?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes
     then
         Dm.tbClientes.Delete;

end;

procedure TfrmClientes.btInserirClick(Sender: TObject);
var
   prox:integer;
begin
      TrataBotoes;

      Dm.tbClientes.Last;  //Posiciona no último registro
      prox := Dm.tbClientes.FieldByName('cdcliente').asInteger + 1;

      Dm.tbClientes.Append; //Insere no final da tabela
      Dm.tbClientes.fieldbyname('cdcliente').asinteger := prox;

      cxDBTextEdit1.SetFocus;
end;
procedure TfrmClientes.btSairClick(Sender: TObject);
begin
     if dm.tbClientes.State IN [dsInsert, dsEdit] then
     begin
          MessageDlg('Cancele ou confirme a operação', mtWarning,
                     [mbOk], 0);
          Exit;
     end;

     Close;
end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //dm.tbClientes.Active := False;

     dm.tbClientes.Close;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
     //dm.tbClientes.Active := True;

     dm.tbClientes.Open;
end;

procedure TfrmClientes.TrataBotoes;
begin

     btInserir.enabled   := not BtInserir.enabled;
     btEditar.enabled    := not BtEditar.enabled;
     btExcluir.enabled   := not BtExcluir.enabled;
     btConfirmar.enabled := not btConfirmar.enabled;
     BtCancelar.enabled  := not BtCancelar.enabled;

     DBNavigator1.Enabled := not DBNavigator1.Enabled;
end;

end.
