unit uMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, ComCtrls, ExtCtrls;

type
  //Declaração de tipo para facilitar outras declarações
  Mat10 = Array[1..10,1..10] of integer;

  TfrmDemoMatProcFunc = class(TForm)
    PageControl1: TPageControl;
    tsMatrizes: TTabSheet;
    tsPlanilha: TTabSheet;
    sgMat: TStringGrid;
    btGera: TBitBtn;
    rgVis: TRadioGroup;
    btValores: TBitBtn;
    sgPlan: TStringGrid;
    sgPlan1: TStringGrid;
    sgPlan2: TStringGrid;
    Timer1: TTimer;
    Panel1: TPanel;
    cbAuto: TCheckBox;
    lbNome: TLabel;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    sgQM: TStringGrid;
    TrackBar1: TTrackBar;
    btGerarQuadMagico: TBitBtn;
    TabSheet2: TTabSheet;
    edP: TEdit;
    edN: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btCombinar: TButton;
    lbRes: TLabel;
    btPrimo: TButton;
    btPar: TButton;
    Label5: TLabel;
    procedure btGeraClick(Sender: TObject);
    procedure rgVisClick(Sender: TObject);
    procedure btValoresClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbAutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure btGerarQuadMagicoClick(Sender: TObject);
    procedure btCombinarClick(Sender: TObject);
    procedure btPrimoClick(Sender: TObject);
    procedure btParClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    teste : Integer;
    procedure Espera(tempo : Integer);
    function  Fat(num : integer) : integer;
    function  Primo(num : integer) : String;
    function  Par(num : integer) : String;

    function  Soma(M : Mat10) : Integer;
    function  Media(M : Mat10) : Real;
  end;

var
  frmDemoMatProcFunc: TfrmDemoMatProcFunc;
  opcao : integer = 0;

implementation

uses uPrincipal;

{$R *.DFM}

procedure TfrmDemoMatProcFunc.btGeraClick(Sender: TObject);
var lin, col : integer;
begin
  for lin := 1 to 10 do
    for col := 1 to 10 do
      sgMat.Cells[col,lin] := IntToStr(Random(100));
end;

procedure TfrmDemoMatProcFunc.rgVisClick(Sender: TObject);
var lin, col : integer;
begin
  btGera.Click;

  //Desafio
  //Tente otimizar o código abaixo
  case rgVis.ItemIndex of
    0 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin <> col) then
                sgMat.Cells[col,lin] := '';
        end;
    1 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin + col <> 11) then
                sgMat.Cells[col,lin] := '';
        end;
    2 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin >= col) then
                sgMat.Cells[col,lin] := '';
        end;
    3 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin <= col) then
                sgMat.Cells[col,lin] := '';
        end;
    4 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin + col >= 11) then
                sgMat.Cells[col,lin] := '';
        end;
    5 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin + col <= 11) then
                sgMat.Cells[col,lin] := '';
        end;
    6 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin >= col) or (lin + col >= 11) then
                sgMat.Cells[col,lin] := '';
        end;
    7 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin >= col) or (lin + col <= 11) then
                sgMat.Cells[col,lin] := '';
        end;
    8 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin <= col) or (lin + col >= 11) then
                sgMat.Cells[col,lin] := '';
        end;
    9 : begin
          for lin := 1 to 10 do
            for col := 1 to 10 do
              if (lin <= col) or (lin + col <= 11) then
                sgMat.Cells[col,lin] := '';
        end;

  end;

end;

procedure TfrmDemoMatProcFunc.btValoresClick(Sender: TObject);
var i , j, soma, maior, menor : integer;
begin
  sgPlan.Cells[1,0] := 'Prod. 01';
  sgPlan.Cells[2,0] := 'Prod. 02';
  sgPlan.Cells[3,0] := 'Prod. 03';
  sgPlan.Cells[4,0] := 'Prod. 04';

  sgPlan.Cells[0,1]  := 'Jan';
  sgPlan.Cells[0,2]  := 'Fev';
  sgPlan.Cells[0,3]  := 'Mar';
  sgPlan.Cells[0,4]  := 'Abr';
  sgPlan.Cells[0,5]  := 'Mai';
  sgPlan.Cells[0,6]  := 'Jun';
  sgPlan.Cells[0,7]  := 'Jul';
  sgPlan.Cells[0,8]  := 'Ago';
  sgPlan.Cells[0,9]  := 'Set';
  sgPlan.Cells[0,10] := 'Out';
  sgPlan.Cells[0,11] := 'Nov';
  sgPlan.Cells[0,12] := 'Dez';

  sgPlan1.Cells[0,0] := 'Soma';
  sgPlan1.Cells[0,1] := 'Média';
  sgPlan1.Cells[0,2] := 'Max.';
  sgPlan1.Cells[0,3] := 'Mín.';
  for i := 0 to 3 do
    for j := 1 to 4 do
      sgPlan1.Cells[j,i] := '0';

  sgPlan2.Cells[0,0] := 'Soma';
  sgPlan2.Cells[1,0] := 'Média';
  sgPlan2.Cells[2,0] := 'Max.';
  sgPlan2.Cells[3,0] := 'Mín.';
  for i := 1 to 12 do
    for j := 0 to 3 do
      sgPlan2.Cells[j,i] := '0';

  for i := 1 to 12 do
    for j := 1 to 4 do
      sgPlan.Cells[j,i] := IntToStr(Random(10));

  //soma
  for j := 1 to 4 do
  begin
      soma := 0;
      for i := 1 to 12 do
        soma := soma + strtoint(sgPlan.Cells[j, i]);
      sgPlan1.Cells[j,0] := IntToStr(soma);
      sgPlan1.Cells[j,1] := FormatFloat(',0.00',soma/12);
  end;

  for i := 1 to 12 do
  begin
      soma := 0;
      for j := 1 to 4 do
        soma := soma + strtoint(sgPlan.Cells[j, i]);
      sgPlan2.Cells[0,i] := IntToStr(soma);
      sgPlan2.Cells[1,i] := FormatFloat(',0.00',soma/12);
  end;

  // max & min

  for j := 1 to 4 do
  begin
      maior := strtoint(sgPlan.Cells[j, 1]);
      menor := strtoint(sgPlan.Cells[j, 1]);
      for i := 1 to 12 do
      begin
        if maior < strtoint(sgPlan.Cells[j, i]) then
          maior := strtoint(sgPlan.Cells[j, i]);
        if menor > strtoint(sgPlan.Cells[j, i]) then
          menor := strtoint(sgPlan.Cells[j, i]);
      end;
      sgPlan1.Cells[j,2] := IntToStr(maior);
      sgPlan1.Cells[j,3] := IntToStr(menor);
  end;

  for i := 1 to 12 do
  begin
      maior := strtoint(sgPlan.Cells[1, i]);
      menor := strtoint(sgPlan.Cells[1, i]);
      for j := 1 to 4 do
      begin
        if maior < strtoint(sgPlan.Cells[j, i]) then
          maior := strtoint(sgPlan.Cells[j, i]);
        if menor > strtoint(sgPlan.Cells[j, i]) then
          menor := strtoint(sgPlan.Cells[j, i]);
      end;
      sgPlan2.Cells[2,i] := IntToStr(maior);
      sgPlan2.Cells[3,i] := IntToStr(menor);
  end;


end;

procedure TfrmDemoMatProcFunc.Timer1Timer(Sender: TObject);
begin
  case opcao of
    0..9 : begin
             Timer1.Interval := 750;
             PageControl1.ActivePage := tsMatrizes;
             rgVis.ItemIndex := opcao;
             inc(opcao);
             Application.ProcessMessages;
           end;
      10 : begin
             Timer1.Enabled := False;
             Timer1.Interval :=1000;
             Timer1.Enabled := True;
             PageControl1.ActivePage := tsPlanilha;
             btValores.Click;
             Application.ProcessMessages;
             opcao := 0;
           end;
  end;
end;

procedure TfrmDemoMatProcFunc.Espera(tempo : integer);
begin
  sleep(tempo);
  Application.ProcessMessages;
end;

procedure TfrmDemoMatProcFunc.cbAutoClick(Sender: TObject);
begin
//  Timer1.Enabled := cbAuto.Checked;
     if cbAuto.Checked then
       Timer1.Enabled := True
     else
       Timer1.Enabled := False;
end;

procedure TfrmDemoMatProcFunc.FormActivate(Sender: TObject);
begin
  lbNome.Caption := frmPrincipal.nome;
end;

procedure TfrmDemoMatProcFunc.TrackBar1Change(Sender: TObject);
var p,col,lin : integer;
begin
  p := TrackBar1.Position;
  if not odd(p) then
  begin
    inc(p);
    TrackBar1.Position := p;
  end;
  sgQM.RowCount := p;
  sgQM.ColCount := p;

  for lin := 0 to p do
    for col := 0 to p do
      sgQM.Cells[col,lin] := '';

end;

procedure TfrmDemoMatProcFunc.btGerarQuadMagicoClick(Sender: TObject);
var n, lin, col, cont : integer;
    m : array[0..27, 0..27] of integer;
begin
  n := TrackBar1.Position;

  //Este laço serve apenas para inicializar a matriz
  for lin := 0 to n-1 do
    for col := 0 to n-1 do
      m[lin,col] := 0;

  col := (n div 2);
  lin := 0;
  m[lin,col] := 1;
  sgQM.Cells[col,lin] := IntToStr(m[lin,col]);
  cont := 2;
  if (n > 1) then
  Repeat
    dec(lin);
    dec(col);
    if (lin < 0) and (col < 0) then
    begin
      lin := 1;
      col := 0;
    end;
    if (lin < 0) then lin := n-1;
    if (col < 0) then col := n-1;
    if (m[lin,col] <> 0) then
    begin
      inc(col);
      inc(lin,2);
    end;
    m[lin,col] := cont;
    sgQM.Cells[col,lin] := IntToStr(m[lin,col]);
    sleep(1);  // faz o pc não fazer nada durante 1 milisegundo
    Application.ProcessMessages;
    cont := cont  + 1;
  Until cont > n*n;
end;

procedure TfrmDemoMatProcFunc.btCombinarClick(Sender: TObject);
var p, n, pn : integer;
           c : Real;
begin
  p := StrToInt(edP.Text);
  n := StrToInt(edN.Text);
  c := Fat(P) / (Fat(n)* Fat(p-n));
  lbRes.Caption := FormatFloat('0',c);
end;

function TfrmDemoMatProcFunc.Fat(num: integer): integer;
var cont, f : integer;
begin
  f := 1;
  for cont := 1 to num do
    f := f * cont;
  // Resultado
  Result := f;
end;

procedure TfrmDemoMatProcFunc.btPrimoClick(Sender: TObject);
var n : integer;
begin
  n := StrToInt(edN.Text);
  lbRes.Caption := Primo(n);
end;

function TfrmDemoMatProcFunc.Primo(num: integer) : String;
var cont , ndiv : integer;
begin
  ndiv := 0;
  for cont := 1 to num do
    if num mod cont = 0 then
      inc(ndiv);
  if ndiv <= 2 then
    Result := 'É primo !'
  else
    Result := 'Não é primo !';
end;

procedure TfrmDemoMatProcFunc.btParClick(Sender: TObject);
var n : integer;
begin
  n := StrToInt(edN.Text);
  lbRes.Caption := Par(n);
end;

function TfrmDemoMatProcFunc.Par(num: integer): String;
begin
  if num mod 2 = 0 then
    Result := 'É par !'
  else
    Result := 'É ímpar !';
end;

function Identidade(M : Mat10) : Boolean;
var l, c : integer;
    flag : Boolean;
begin
  flag := True;
  l := 1;
  while (l <= 10) and (flag) do
  begin
    c := 1;
    while (c <= 10) and (flag) do
    begin
      if (l=c) and (m[l,c] <> 1) then
        flag := False;
      if (l<>c) and (m[l,c] <> 0) then
        flag := False;
      inc(c);
    end;
    inc(l);
  end;
  Result := flag;
end;

function Simetrica(X : Mat10) : Boolean;
var l, c : integer;
    flag : Boolean;
begin
  flag := True;
  l := 1;
  while (l <= 10) and (flag) do
  begin
    c := 1;
    while (c <= 10) and (flag) do
    begin
      flag := x[l,c] <> x[c,l];
      inc(c);
    end;
    inc(l);
  end;
  Result := flag;
end;


function TfrmDemoMatProcFunc.Media(M: Mat10): Real;
begin
  Result := Soma(M) / 100;
end;

function TfrmDemoMatProcFunc.Soma(M: Mat10): Integer;
var s, l, c : integer;
begin
  s := 0;
  for l := 1 to 10 do
    for c := 1 to 10 do
      s := s + m[l,c];

  Result := s ;
end;

procedure TfrmDemoMatProcFunc.Button5Click(Sender: TObject);
var M10 : Mat10;
    
begin
end;

function SQN(M : Mat10; Tipo : Char) : Integer;
var l,c, s : integer;
begin
  s := 0;
  for l := 1 to 10 do
    for c := 1 to 10 do
    begin
      if (tipo = 'P') and (m[l,c] mod 2 = 0) then
        s := s + m[l,c]
      else
        if (tipo = 'I') and (m[l,c] mod 2 <> 0) then
          s := s + m[l,c]
    end;
  Result := s;
end;

function SomaLinha(Mat: Mat10; Lin : integer) : Integer;
var c, s : integer;
begin
  s := 0;
  for c := 1 to 10 do
    s := s + Mat[Lin, c];

  Result := s;
end;

function SomaColuna(Mat: Mat10; Col : integer) : Integer;
var l, s : integer;
begin
  s := 0;
  for l := 1 to 10 do
    s := s + Mat[l,Col];

  Result := s;
end;


end.
