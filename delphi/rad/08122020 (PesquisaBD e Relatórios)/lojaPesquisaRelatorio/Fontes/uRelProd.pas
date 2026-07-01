unit uRelProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, RLReport;

type
  TfrmRelProd = class(TForm)
    rlRel: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel4: TRLLabel;
    RLBand4: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLDBResult1: TRLDBResult;
    RLLabel5: TRLLabel;
    procedure FormActivate(Sender: TObject);
    procedure rlRelBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlRelAfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProd: TfrmRelProd;

implementation

{$R *.dfm}

procedure TfrmRelProd.FormActivate(Sender: TObject);
begin
     //rlRel.Preview;
end;

procedure TfrmRelProd.rlRelAfterPrint(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelProd.rlRelBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
     dm.tbProdutos.Open;
end;

end.
