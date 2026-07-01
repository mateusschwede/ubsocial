unit uFornec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons,Data.Db;

type
  TfrmFornec = class(TForm)
    pFornec2: TPanel;
    pFornec: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    btInserir: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    btCancelar: TBitBtn;
    btConfirmar: TBitBtn;
    btSair: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
        Procedure TrataBotoes;
  public
    { Public declarations }
  end;

var
  frmFornec: TfrmFornec;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmFornec.btCancelarClick(Sender: TObject);
begin
  dm.tbFornec.Cancel;
  TrataBotoes;
end;

procedure TfrmFornec.btConfirmarClick(Sender: TObject);
begin
  if dm.tbFornec.FieldByName('dcfornecedor').AsString = '' then
  begin
    MessageDlg('Informe o nome',mtWarning,[mbOk],0);
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
  if MessageDlg('Excluir?',mtConfirmation,[mbYes,mbNo],0) = mrYes then Dm.tbFornec.Delete;
end;

procedure TfrmFornec.btInserirClick(Sender: TObject);
var prox: Integer;
begin
  TrataBotoes;
  Dm.tbFornec.Last;
  prox := Dm.tbFornec.FieldByName('cdfornecedor').asInteger+1;
  Dm.tbFornec.Append;
  Dm.tbFornec.fieldbyname('cdfornecedor').asinteger := prox;
end;

procedure TfrmFornec.btSairClick(Sender: TObject);
begin
  if dm.tbFornec.State IN [dsInsert,dsEdit] then
  begin
    MessageDlg('Cancele ou confirme',mtWarning,[mbOk],0);
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

procedure TfrmFornec.TrataBotoes;
begin
  btInserir.Enabled := not btInserir.Enabled;
  btEditar.Enabled := not btEditar.Enabled;
  btExcluir.Enabled := not btExcluir.Enabled;
  btConfirmar.Enabled := not btConfirmar.Enabled;
  btCancelar.Enabled := not btCancelar.Enabled;
  DBNavigator1.Enabled := not DBNavigator1.Enabled;
end;
end.
