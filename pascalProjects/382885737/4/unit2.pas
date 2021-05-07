unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs,Grids;
type
  str=string[20];
  player=record
  name,team,spec: str;
  year:integer;
  end;
  fileOfPlayers=file of player;
  procedure print(var SG:TStringGrid; var F:fileOfPlayers);
  procedure createFileP(var F:fileOfPlayers);
  procedure addFirst(var F:fileOfPlayers);
  procedure sortP(var F:fileOfPlayers);
  procedure findByYearAndTeam(var SG:TStringGrid; var F:fileOfPlayers);
  procedure FindInDurationP(var SG:TStringGrid; var F:fileOfPlayers);
implementation
 procedure print(var SG:TStringGrid;var F:fileOfPlayers);
 var
    i: byte;
    c: player;
    fileName:string;
 begin
    Reset(F);
    SG.ColCount:=5;
    SG.RowCount:=FileSize(f)+1;
    i:=1;
    while not EOF(F) do
      begin
         Read(F, c);
         SG.cells[0,i]:=inttostr(i);
         SG.cells[1,i]:=c.team;
         SG.cells[2,i]:=c.name;
         SG.cells[3,i]:=inttostr(c.year);
         SG.cells[4,i]:=c.spec;
         i:=i+1;
      end;
    Close(F);
 end;
 procedure createFileP(var F:fileOfPlayers);
 var
    i,m: byte;
    c: player;
    nameOfFile:string;
 begin
    nameOfFile:= inputbox('title', 'Введите название файла(для Alpha.dat - Alpha)','Alpha');
    Assign(F, nameOfFile+'.dat');
    rewrite(F);
    m:= strtoint(inputbox('title','Сколько игроков будет в новом файле?',''));
    for i := 1 to m do
    begin
      c.team:=inputbox('title', 'ВВЕДИТЕ КОМАНДУ','');
      c.name:=inputbox('title', 'ВВЕДИТЕ ФАМИЛИЮ','');
      c.spec:=inputbox('title', 'ВВЕДИТЕ СПЕЦИАЛИЗАЦИЮ(attack/defend)','');
      c.year:=strtoint(inputbox('title', 'ВВЕДИТЕ ГОД РОЖДЕНИЯ',''));
      Write(F, c);
    end;
    Close(F);
 end;
 procedure addFirst(var F:fileOfPlayers);
 var
    i,m: byte;
    c: player;
    fTmpS:string;
    fTmp:fileOfPlayers;
 begin
 Reset(F);
 ftmps:='temp.tmp';
 Assignfile(ftmp, ftmps);
 rewrite(ftmp);
 c.team:=inputbox('title', 'ВВЕДИТЕ КОМАНДУ','');
 c.name:=inputbox('title', 'ВВЕДИТЕ ФАМИЛИЮ','');
 c.spec:=inputbox('title', 'ВВЕДИТЕ СПЕЦИАЛИЗАЦИЮ(attack/defend)','');
 c.year:=strtoint(inputbox('title', 'ВВЕДИТЕ ГОД РОЖДЕНИЯ',''));
 Write(ftmp, c);
 while not EOF(F) do
 begin
       Read(F, c);
       Write(ftmp, c);
 end;
 close(f);
 rewrite(f);
 close(ftmp);
 reset(ftmp);
 while not EOF(ftmp) do
 begin
       Read(ftmp, c);
       Write(f, c);
 end;
 close(ftmp);
end;
 procedure sortP(var F:fileOfPlayers);
 var i, j, n:integer;
     stud1, stud2:player;
 begin
 reset(f);
 n:=filesize(f);
 for i:=0 to n-1 do
     for j:=0 to n-2 do
     begin
          seek(f, j);
          read(f, stud1);
          read(f, stud2);
          if (stud1.year > stud2.year) then
          begin
               seek(f, j);
               write(f, stud2);
               write(f, stud1);
          end;
     end;
 close(f);
 end;
 procedure findByYearAndTeam(var SG:TStringGrid; var F:fileOfPlayers);
 var
 i:integer;
 team,year:string;
 c:player;
 begin
    team:=inputbox('title','Введите команду','');
    year:=inputbox('title','Введите год рождения','');
    Reset(F);
    SG.ColCount:=5;
    SG.RowCount:=FileSize(f)+1;

    i:=1;
    while not EOF(F) do
      begin
         Read(F, c);
           if (c.team=team )and (c.year=strtoint(year)) and (c.spec='defend') then begin
            SG.cells[0,i]:=inttostr(i);
            SG.cells[1,i]:=c.team;
            SG.cells[2,i]:=c.name;
            SG.cells[3,i]:=inttostr(c.year);
            SG.cells[4,i]:=c.spec;
            i:=i+1;
         end;
      end;
    SG.RowCount:=i;
    Close(F);

 end;

 procedure FindInDurationP(var SG:TStringGrid; var F:fileOfPlayers);
 var
 i,n,m:integer;
 s:integer;
 c:player;
 begin
    n:=strtoint(inputbox('title','Введите год(n), n - меньшее','2001'));
    m:=strtoint(inputbox('title','Введите год(m)','2010'));
    Reset(F);
    SG.ColCount:=5;
    SG.RowCount:=FileSize(f)+1;
    i:=1;
    while not EOF(F) do
      begin
         Read(F, c);
         if (c.spec='attack')and(c.year>=n)and(c.year<=m) then begin
            SG.cells[0,i]:=inttostr(i);
            SG.cells[1,i]:=c.name;
            SG.cells[2,i]:=c.team;
            SG.cells[3,i]:=inttostr(c.year);
            SG.cells[4,i]:=c.spec;
            i:=i+1;
         end;
      end;
    SG.RowCount:=i;
    Close(F);
 end;

end.

