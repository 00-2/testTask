unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TAGraph,
  TASeries, TADrawUtils, TACustomSeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    draw: TButton;
    Chart: TChart;
    FuncSeries: TLineSeries;
    Xmin: TEdit;
    Xmax: TEdit;
    Enter: TLabel;
    procedure drawClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure XminChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

function isNumeric(var s:string):Boolean;
var
  i, n: integer;
begin
  n := 0;
  for i := 1 to Length(s) do
    if (s[i] in ['0'..'9']) or (S[i] = '.') or (S[i] = ',') then
    Else
    begin
      writeln('ERROR');
      Exit;
    end;
   if (s[length(s)] = '.') or (S[length(s)] = ',') then
    begin
      n:=1;
      writeln('ERROR');
    end;
   if n = 0 then
    isNumeric:=True else
    isNumeric:=False;
end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.XminChange(Sender: TObject);
begin

end;

procedure TForm1.drawClick(Sender: TObject);
var i,n:integer;
minX,maxX,x:real;
s:String;
begin
   FuncSeries.Clear;
   s:=Xmin.Text;
   if isNumeric(s) then minX:=s.ToDouble()
   else minX:=-10;

   s:=Xmax.Text;
   if isNumeric(s) then maxX:=s.ToDouble()
   else maxX:=10;

   n:=abs(Round(maxX-minX))*100;

   writeln(minX:5:2,' ',maxX:5:2);
   for i:=0 to n do begin
    x := minX + (maxX - minX) * i /(N - 1);
    FuncSeries.AddXY(x, x*x);
  end;
end;


end.

