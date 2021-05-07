unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type
student = record
      surname:string;
      rus,math,bio:integer;
        end;
  arr=array[1..20] of student;
  { TForm1 }
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private

  public
  end;

var
  Form1: TForm1;
  n,prohodMath,prohodBio,prohodRus:integer;
  tmas:arr;

implementation



{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
  tmp:student;
begin
       n:=strtoint(edit1.text);
       prohodMath:= strtoint(inputbox('','Проходной балл математика','10'));
       prohodBio:=strtoint(inputbox('','Проходной балл Био','10'));
       prohodRus:=strtoint(inputbox('','Проходной балл Русский','10'));
       for i:=1 to n do begin
          tmas[i].surname:=inputbox('','Введите фамилию','surname');
          tmas[i].Bio:=strtoint(inputbox('','Введите значение био','10'));
          tmas[i].Math:=strtoint(inputbox('','Введите значение мат','10'));
          tmas[i].Rus:=strtoint(inputbox('','Введите значение рус','10'));
       end;
       StringGrid1.RowCount:=n+1;
       StringGrid1.ColCount:=4;
       for i:=1 to n do begin
          StringGrid1.cells[0,i]:=tmas[i].surname;
          StringGrid1.cells[1,i]:=inttostr(tmas[i].Bio);
          StringGrid1.cells[2,i]:=inttostr(tmas[i].Math);
          StringGrid1.cells[3,i]:=inttostr(tmas[i].Rus);
       end;
       StringGrid2.RowCount:=n+1;
       StringGrid2.ColCount:=4;
       j:=0;
       for i:=1 to n do begin
          if (tmas[i].Bio>=prohodBio)and(tmas[i].Rus>=prohodRus)and(tmas[i].Math>=prohodMath) then begin
          j:=j+1;
          StringGrid2.cells[0,j]:=tmas[i].surname;
          StringGrid2.cells[1,j]:=inttostr(tmas[i].Bio);
          StringGrid2.cells[2,j]:=inttostr(tmas[i].Math);
          StringGrid2.cells[3,j]:=inttostr(tmas[i].Rus);
          end;
       end;
end;

end.

