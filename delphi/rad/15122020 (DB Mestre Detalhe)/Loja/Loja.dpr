program Loja;

uses
  Vcl.Forms,
  uMenu in 'Fontes\uMenu.pas' {frmMenu},
  uDM in 'Fontes\uDM.pas' {dm: TDataModule},
  uClientes in 'Fontes\uClientes.pas' {frmClientes},
  uFornec in 'Fontes\uFornec.pas' {frmFornec},
  uProd in 'Fontes\uProd.pas' {frmProd},
  uConsulta in 'Fontes\uConsulta.pas' {frmPesquisar},
  uRelProd in 'Fontes\uRelProd.pas' {frmRelProd},
  uVenda in 'Fontes\uVenda.pas' {frmVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmFornec, frmFornec);
  Application.CreateForm(TfrmProd, frmProd);
  Application.CreateForm(TfrmPesquisar, frmPesquisar);
  Application.CreateForm(TfrmRelProd, frmRelProd);
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.Run;
end.
