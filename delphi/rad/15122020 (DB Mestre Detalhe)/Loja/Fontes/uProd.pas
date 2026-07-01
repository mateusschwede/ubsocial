unit uProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uDM, cxGraphics, cxControls, cxLookAndFeels, Data.DB,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxDBEdit;

type
  TfrmProd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btInserir: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btCancelar: TBitBtn;
    btConfirmar: TBitBtn;
    DBNavigator1: TDBNavigator;
    btSair: TBitBtn;
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
    DBText1: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btSairClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure TrataBotoes;
  public
    { Public declarations }
  end;

var
  frmProd: TfrmProd;

implementation

{$R *.dfm}

{ TfrmProd }

procedure TfrmProd.btCancelarClick(Sender: TObject);
begin
     TrataBotoes;
     dm.tbProdutos.Cancel;
end;

procedure TfrmProd.btConfirmarClick(Sender: TObject);
begin
     // Regras de validação
     if dm.tbProdutos.FieldByName('DCPRODUTO').AsString = '' then
     begin
          MessageDlg('Falta digitar o nome do produto',
                     mtWarning, [mbOk], 0);
          cxDBTextEdit1.SetFocus;
          Exit;
     end;

     dm.tbProdutos.Post;
     TrataBotoes;
end;

procedure TfrmProd.btEditarClick(Sender: TObject);
begin
     TrataBotoes;
     dm.tbProdutos.Edit;
end;

procedure TfrmProd.btExcluirClick(Sender: TObject);
begin
     if MessageDlg('Deseja realmente excluir?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes
     then
         Dm.tbProdutos.Delete;
end;

procedure TfrmProd.btInserirClick(Sender: TObject);
var
   prox:integer;
begin
      TrataBotoes;

      Dm.tbProdutos.Last;  //Posiciona no último registro
      prox := Dm.tbProdutos.FieldByName('cdproduto').asInteger + 1;

      Dm.tbProdutos.Append; //Insere no final da tabela
      Dm.tbProdutos.fieldbyname('cdproduto').asinteger := prox;

      cxDBTextEdit1.SetFocus;end;

procedure TfrmProd.btSairClick(Sender: TObject);
begin
     if dm.tbProdutos.State IN [dsInsert, dsEdit] then
     begin
          MessageDlg('Cancele ou confirme a operação', mtWarning,
                     [mbOk], 0);
          Exit;
     end;

     Close;
end;

procedure TfrmProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dm.tbProdutos.Close;
     dm.tbFornec.Close;
end;

procedure TfrmProd.FormShow(Sender: TObject);
begin
     dm.tbProdutos.Open;
     dm.tbFornec.Open;
end;

procedure TfrmProd.TrataBotoes;
begin
     btInserir.enabled   := not BtInserir.enabled;
     btEditar.enabled    := not BtEditar.enabled;
     btExcluir.enabled   := not BtExcluir.enabled;
     btConfirmar.enabled := not btConfirmar.enabled;
     BtCancelar.enabled  := not BtCancelar.enabled;

     DBNavigator1.Enabled := not DBNavigator1.Enabled;
end;

end.
