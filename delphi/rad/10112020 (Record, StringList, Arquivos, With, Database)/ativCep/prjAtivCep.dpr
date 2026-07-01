program prjAtivCep;

uses
  Vcl.Forms,
  uAtivCep in 'uAtivCep.pas' {AtivCepMateus};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAtivCepMateus, AtivCepMateus);
  Application.Run;
end.
