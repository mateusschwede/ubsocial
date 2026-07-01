unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edNome: TEdit;
    btExec: TButton;
    procedure btExecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Nome : String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uMat;

{$R *.DFM}

procedure TfrmPrincipal.btExecClick(Sender: TObject);
begin
      //A variável nome está declarada como pública (logo acima)
      // para que possa ser acessada de outro form
      nome := edNome.Text;

      frmDemoMatProcFunc.ShowModal;
end;

end.
