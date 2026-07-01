program Loja;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {Form1},
  uDM in 'uDM.pas' {dm: TDataModule},
  uClientes in 'uClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
