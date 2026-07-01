unit uSkins;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Themes, Vcl.ExtCtrls,  IniFiles, Vcl.Menus;

type
  TfrmSkins = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cmbSkins: TComboBox;
    mmTxt: TMemo;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Editar1: TMenuItem;
    Formatar1: TMenuItem;
    Utilitrios1: TMenuItem;
    Sobre1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Sair1: TMenuItem;
    N1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Copiar1: TMenuItem;
    Colar1: TMenuItem;
    Recortar1: TMenuItem;
    N2: TMenuItem;
    ools1: TMenuItem;
    Limpar1: TMenuItem;
    FontDialog1: TFontDialog;
    Fonte1: TMenuItem;
    Contarcaracteres1: TMenuItem;
    ConvMAISCULAS1: TMenuItem;
    ConvMinsculas1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cmbSkinsChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Colar1Click(Sender: TObject);
    procedure Recortar1Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure Contarcaracteres1Click(Sender: TObject);
    procedure ConvMAISCULAS1Click(Sender: TObject);
    procedure ConvMinsculas1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  {
  Local dos Styles

  C:\Users\Public\Documents\Embarcadero\Studio\20.0\Styles


  }
Const
   NomeIni = '.\Configuracao.ini';

var
  frmSkins: TfrmSkins;
  ArqINI : TIniFile;

implementation

{$R *.dfm}

uses uSobre;

procedure TfrmSkins.Abrir1Click(Sender: TObject);
begin
     if OpenDialog1.Execute then
     begin
          mmTxt.Lines.LoadFromFile(OpenDialog1.FileName);
     end;
end;

procedure TfrmSkins.cmbSkinsChange(Sender: TObject);
begin
     TStyleManager.TrySetStyle( cmbSkins.Items[cmbSkins.ItemIndex] );
end;

procedure TfrmSkins.Colar1Click(Sender: TObject);
begin
     mmTxt.PasteFromClipboard;
end;

procedure TfrmSkins.Contarcaracteres1Click(Sender: TObject);
var ind, ii, totCarac : integer;
    txt : string;
begin
     totCarac := 0;
     for ind := 0 to mmTxt.Lines.Count-1 do
     begin
          txt := mmTxt.Lines[ ind ];
          for ii := 1 to Length(txt) do
             if txt[ii] in ['a'..'z','A'..'Z'] then
                inc(totCarac);
     end;

     MessageDlg('Total de Letras:' + totCarac.ToString,
                mtInformation, [mbOk], 0);

     // Qtd. Números
     // Qtd. Carac. Especiais (*/-+.,!@#$¨% ()<><;?.....)

end;

procedure TfrmSkins.ConvMAISCULAS1Click(Sender: TObject);
begin
     mmTxt.Text := UpperCase(mmTxt.Text);
end;

procedure TfrmSkins.ConvMinsculas1Click(Sender: TObject);
begin
     mmTxt.Text := LowerCase(mmTxt.Text);
end;

procedure TfrmSkins.Copiar1Click(Sender: TObject);
begin
     if mmTxt.SelLength > 0 then
        mmTxt.CopyToClipboard
     else
        MessageDlg('Nada selecionado', mtWarning, [mbOk], 0);
end;

procedure TfrmSkins.Fonte1Click(Sender: TObject);
begin
     if FontDialog1.Execute then
       mmTxt.Font := FontDialog1.Font;
end;

procedure TfrmSkins.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ArqIni := TIniFile.Create(NomeIni);
     ArqIni.WriteString('Skin','Style', TStyleManager.ActiveStyle.Name);
     ArqIni.Free;
end;

procedure TfrmSkins.FormCreate(Sender: TObject);
var s : string;
begin
     ArqIni := TIniFile.Create(NomeIni);
     cmbSkins.Items.BeginUpdate;
     try
       cmbSkins.Items.Clear;

       for s in TStyleManager.StyleNames do
          cmbSkins.Items.Add(s);

       cmbSkins.Sorted := True; // Organiza em ordem alfabética

       if FileExists(NomeIni) then
       begin
            cmbSkins.ItemIndex := cmbSkins.Items.IndexOf(
                           ArqIni.ReadString('Skin','Style','Windows'));
            cmbSkinsChange(Self);
       end
       else
         cmbSkins.ItemIndex := cmbSkins.Items.IndexOf(
                                  TStyleManager.ActiveStyle.Name);
     finally
       cmbSkins.Items.EndUpdate;
       ArqIni.Free;
     end;
end;

procedure TfrmSkins.Limpar1Click(Sender: TObject);
begin
     mmTxt.Clear;
end;

procedure TfrmSkins.Recortar1Click(Sender: TObject);
begin
     if mmTxt.SelLength > 0 then
        mmTxt.CutToClipboard
     else
        MessageDlg('Nada selecionado', mtWarning, [mbOk], 0);
end;

procedure TfrmSkins.Sair1Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSkins.Salvar1Click(Sender: TObject);
begin
     if SaveDialog1.Execute then
     begin
          mmTxt.Lines.SaveToFile(SaveDialog1.FileName);
     end;
end;

procedure TfrmSkins.Sobre1Click(Sender: TObject);
begin
     AboutBox.ShowModal;
end;

end.
