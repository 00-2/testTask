unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs,Grids;
type
  str=string[20];
  car=record
  name,number: str;
  year,power,cost:integer;
  end;
  fileOfCars=file of car;
  procedure print(var SG:TStringGrid; var F:fileOfCars);
  procedure createFileP(var F:fileOfCars);
  procedure addP(var F:fileOfCars);
  procedure sortP(var F:fileOfCars);
  procedure findAndWrite(var SG:TStringGrid; var F:fileOfCars);
  procedure FindInDurationP(var SG:TStringGrid; var F:fileOfCars);
implementation
 procedure print(var SG:TStringGrid;var F:fileOfCars);
 var
    i: integer;
    c: car;
 begin
    Reset(F);
    SG.RowCount:=FileSize(f)+1;
    i:=1;
    SG.cells[0,0]:='n';
    SG.cells[1,0]:='Название';
    SG.cells[2,0]:='Номер';
    SG.cells[3,0]:='Год';
    SG.cells[4,0]:='Мощность';
    SG.cells[5,0]:='Цена';
    while not EOF(F) do
      begin
         Read(F, c);
         SG.cells[0,i]:=inttostr(i);
         SG.cells[1,i]:=c.name;
         SG.cells[2,i]:=c.number;
         SG.cells[3,i]:=inttostr(c.year);
         SG.cells[4,i]:=inttostr(c.power);
         SG.cells[5,i]:=inttostr(c.cost);
         i:=i+1;
      end;
    Close(F);
 end;
 procedure createFileP(var F:fileOfCars);
 var
    i,m: integer;
    c: car;
    nameOfFile:string;
 begin
    nameOfFile:= inputbox('title', 'Введите название файла(для File.dat - File)','file');
    Assign(F, nameOfFile+'.dat');
    rewrite(F);
    m:= strtoint(inputbox('title','Сколько машин будет в новом файле?',''));
    for i := 1 to m do
    begin
      c.name:=inputbox('title', 'Введите название','');
      c.number:=inputbox('title', 'Введите номер','');
      c.power:=strtoint(inputbox('title', 'Введите мощность',''));
      c.year:=strtoint(inputbox('title', 'Введите год',''));
      c.cost:=strtoint(inputbox('title', 'Введите стоимость',''));
      Write(F, c);
    end;
    Close(F);
 end;
 procedure addP(var F:fileOfCars);
 var
    i: integer;
    c: car;
 begin
 Reset(F);
 seek(f,filesize(f));
 c.name:=inputbox('title', 'Введите название','');
 c.number:=inputbox('title', 'Введите номер(Россия - 05)','');
 c.power:=strtoint(inputbox('title', 'Введите мощность',''));
 c.year:=strtoint(inputbox('title', 'Введите год',''));
 c.cost:=strtoint(inputbox('title', 'Введите стоимость',''));
 Write(F, c);
end;
 procedure sortP(var F:fileOfCars);
 var i, j, n:integer;
     car1, car2:car;
 begin
 reset(f);
 n:=filesize(f);
 for i:=0 to n-1 do
     for j:=0 to n-2 do
     begin
          seek(f, j);
          read(f, car1);
          read(f, car2);
          if (car1.power > car2.power) then
          begin
               seek(f, j);
               write(f, car2);
               write(f, car1);
          end;
     end;
 close(f);
 end;
 procedure findAndWrite(var SG:TStringGrid; var F:fileOfCars);
 var
 i:integer;
 team,year:string;
 c:car;
 begin
    Reset(F);
    SG.ColCount:=6;
    SG.RowCount:=FileSize(f)+1;
    SG.Clean;
    i:=1;

    SG.cells[0,0]:='n';
    SG.cells[1,0]:='Название';
    SG.cells[2,0]:='Номер';
    SG.cells[3,0]:='Год';
    SG.cells[4,0]:='Мощность';
    SG.cells[5,0]:='Цена';

    while not EOF(F) do
      begin
         Read(F, c);
           if (c.year=2019) and (c.number='05') then begin
              write(f,c);
             SG.cells[0,i]:=inttostr(i);
             SG.cells[1,i]:=c.name;
             SG.cells[2,i]:=c.number;
             SG.cells[3,i]:=inttostr(c.year);
             SG.cells[4,i]:=inttostr(c.power);
             SG.cells[5,i]:=inttostr(c.cost);
              i:=i+1;
         end;
      end;
    SG.RowCount:=i;
    Close(F);

 end;

 procedure FindInDurationP(var SG:TStringGrid; var F:fileOfCars);
 var
 i,n,m,power:integer;
 c:car;
 begin
    n:=strtoint(inputbox('title','Введите мин стоимость','1000'));
    m:=strtoint(inputbox('title','Введите макс стоимость','9999'));
    power:=strtoint(inputbox('title','Введите мощность','130'));
    Reset(F);
    SG.ColCount:=6;
    SG.RowCount:=FileSize(f)+1;
    i:=1;
    SG.cells[0,0]:='n';
    SG.cells[1,0]:='Название';
    SG.cells[2,0]:='Номер';
    SG.cells[3,0]:='Год';
    SG.cells[4,0]:='Мощность';
    SG.cells[5,0]:='Цена';
    while not EOF(F) do
      begin
         Read(F, c);
         if (c.power=power)and(c.cost>=n)and(c.cost<=m) then begin
             SG.cells[0,i]:=inttostr(i);
             SG.cells[1,i]:=c.name;
             SG.cells[2,i]:=c.number;
             SG.cells[3,i]:=inttostr(c.year);
             SG.cells[4,i]:=inttostr(c.power);
             SG.cells[5,i]:=inttostr(c.cost);
            i:=i+1;
         end;
      end;
    SG.RowCount:=i;
    Close(F);
 end;

end.

