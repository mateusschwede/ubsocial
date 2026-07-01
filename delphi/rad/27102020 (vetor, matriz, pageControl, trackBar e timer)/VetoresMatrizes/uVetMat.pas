unit uVetMat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    sgMat: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    sgVet: TStringGrid;
    btSoma: TBitBtn;
    btAdd: TBitBtn;
    ListBox1: TListBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DateTimePicker1: TDateTimePicker;
    BitBtn3: TBitBtn;
    StringGrid1: TStringGrid;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Timer1: TTimer;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure btSomaClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  posini = 1;
  posfin = 10;
var //Global
  Form1: TForm1;

  vetor : array[posini..posfin] of integer;
  matriz : array[1..3, 1..3] of integer;
  // mat3d : array[1..12, 1..10, 1..3] of integer;
  vet : array of Integer;

  tam : integer = 0;

implementation

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
var col, num, lin : integer;

begin
     //Inicialização
     for lin := 0 to sgMat.RowCount-1 do
       sgMat.Cells[0,lin+1] := IntToStr(lin+1);
     for col := 0 to sgMat.ColCount-1 do
       sgMat.Cells[col+1,0] := IntToStr(col+1);

     num := 0;
     for lin := 1 to sgMat.RowCount-1 do
     begin
       for col := 1 to sgMat.ColCount-1 do
       begin
         sgMat.Cells[col,lin] := IntToStr(num);
              matriz[lin,col] := StrToInt(sgMat.Cells[col,lin]);
         inc(num,2);
       end;
     end;

     Randomize;
     for col := 0 to sgVet.ColCount-1 do
     begin
          sgVet.Cells[col,1] := IntToStr(Random(2));
          vetor[col] := StrToInt(sgVet.Cells[col,1]);
     end;






     {
     sgMat.Cells[0,1] := 'Janeiro';
     sgMat.Cells[0,2] := 'Fevereiro';
     sgMat.Cells[0,3] := 'Março';
     }



end;

procedure TForm1.btAddClick(Sender: TObject);
begin
     SetLength(vet, tam+1);
     tam := tam + 1;
     vet[tam-1] := Random(100);
     ListBox1.Items.Add('vet['+(tam-1).ToString+']='+(vet[tam-1]).ToString)
end;

procedure TForm1.btSomaClick(Sender: TObject);
var c, l, soma : integer;
begin
     soma := 0;
     for c := 0 to sgVet.ColCount-1 do
     begin
          soma := soma + vetor[c];
     end;

     btSoma.Caption := 'Soma dos valores = ' + soma.ToString;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i : integer;
begin
     for I := 0 to 100 do
     begin
        //lógica
        ProgressBar1.Position := i;
        sleep(10);
     end;

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
     Timer1.Enabled := CheckBox1.Checked;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     Label2.Caption := TimeToStr(time);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
     Label1.Font.Size := TrackBar1.Position;
end;

end.
