program Loja;

uses
  Vcl.Forms,
  uMenu in 'Fontes\uMenu.pas' {Form1},
  uDM in 'Fontes\uDM.pas' {dm: TDataModule},
  uClientes in 'Fontes\uClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
