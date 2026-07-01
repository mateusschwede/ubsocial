program prjSkins;

uses
  Vcl.Forms,
  uSkins in 'uSkins.pas' {frmSkins},
  Vcl.Themes,
  Vcl.Styles,
  uSobre in 'uSobre.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSkins, frmSkins);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
