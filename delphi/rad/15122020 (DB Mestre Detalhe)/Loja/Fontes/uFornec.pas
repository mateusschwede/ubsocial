unit uFornec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.DB,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uDM, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.DBCtrls, cxTextEdit, cxDBEdit, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmFornec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btInserir: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btCancelar: TBitBtn;
    btConfirmar: TBitBtn;
    btSair: TBitBtn;
    DBNavigator1: TDBNavigator;
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
    DBText1: TDBText;
    procedure btInserirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure Tratabotoes;  //ctrl+shift+c
  public
    { Public declarations }
  end;

var
  frmFornec: TfrmFornec;

implementation

{$R *.dfm}

procedure TfrmFornec.btCancelarClick(Sender: TObject);
begin
     dm.tbFornec.Cancel;
     TrataBotoes;
end;

procedure TfrmFornec.btConfirmarClick(Sender: TObject);
begin
     // Regras de validação
     if dm.tbFornec.FieldByName('DCFORNECEDOR').AsString = '' then
     begin
          MessageDlg('Falta digitar o nome do fornecedor',
                     mtWarning, [mbOk], 0);
          cxDBTextEdit1.SetFocus;
          Exit;
     end;

     dm.tbFornec.Post;
     TrataBotoes;
end;

procedure TfrmFornec.btEditarClick(Sender: TObject);
begin
     TrataBotoes;
     dm.tbFornec.Edit;
end;

procedure TfrmFornec.btExcluirClick(Sender: TObject);
begin
     if MessageDlg('Deseja realmente excluir?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes
     then
         Dm.tbFornec.Delete;
end;

procedure TfrmFornec.btInserirClick(Sender: TObject);
var
   prox:integer;
begin
      TrataBotoes;

      Dm.tbFornec.Last;  //Posiciona no último registro
      prox := Dm.tbFornec.FieldByName('cdfornecedor').asInteger + 1;

      Dm.tbFornec.Append; //Insere no final da tabela
      Dm.tbFornec.fieldbyname('cdfornecedor').asinteger := prox;

      cxDBTextEdit1.SetFocus;
end;

procedure TfrmFornec.btSairClick(Sender: TObject);
begin
     if dm.tbFornec.State IN [dsInsert, dsEdit] then
     begin
          MessageDlg('Cancele ou confirme a operação', mtWarning,
                     [mbOk], 0);
          Exit;
     end;

     Close;
end;

procedure TfrmFornec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dm.tbFornec.Close;
end;

procedure TfrmFornec.FormShow(Sender: TObject);
begin
     dm.tbFornec.Open;
end;

procedure TfrmFornec.Tratabotoes;
begin
     btInserir.enabled   := not BtInserir.enabled;
     btEditar.enabled    := not BtEditar.enabled;
     btExcluir.enabled   := not BtExcluir.enabled;
     btConfirmar.enabled := not btConfirmar.enabled;
     BtCancelar.enabled  := not BtCancelar.enabled;

     DBNavigator1.Enabled := not DBNavigator1.Enabled;
end;

end.
