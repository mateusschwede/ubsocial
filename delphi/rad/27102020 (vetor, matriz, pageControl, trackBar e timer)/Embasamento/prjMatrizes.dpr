program prjMatrizes;

uses
  Forms,
  uMat in 'uMat.pas' {frmDemoMatProcFunc},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmDemoMatProcFunc, frmDemoMatProcFunc);
  Application.Run;
end.
