unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs,Grids;
type
  str=string[20];
  book=record
  name,author: str;
  year:integer;
  end;
  fileOfBooks=file of book;
  procedure print(var SG:TStringGrid; var F:fileOfBooks);
  procedure createFileP(var F:fileOfBooks);
  procedure addLast(var F:fileOfBooks);
  procedure sortP(var F:fileOfBooks);
  procedure findMoreThan1(var SG:TStringGrid; var F:fileOfBooks);
  procedure findByAuthorP(var SG:TStringGrid; var F:fileOfBooks);
  procedure findByYearP(var SG:TStringGrid; var F:fileOfBooks);
implementation
 procedure print(var SG:TStringGrid;var F:fileOfBooks);
 var
    i: byte;
    c: book;
    fileName:string;
 begin
    Reset(F);
    SG.ColCount:=4;
    SG.RowCount:=FileSize(f)+1;
    i:=1;
    while not EOF(F) do
      begin
         Read(F, c);
         SG.cells[0,i]:=inttostr(i);
         SG.cells[1,i]:=c.name;
         SG.cells[2,i]:=c.author;
         SG.cells[3,i]:=inttostr(c.year);
         i:=i+1;
      end;
    Close(F);
 end;
 procedure createFileP(var F:fileOfBooks);
 var
    i,m: byte;
    c: book;
    nameOfFile:string;
 begin
    nameOfFile:= inputbox('title', 'Введите название файла(для Alpha.dat - Alpha)','Alpha');
    Assign(F, nameOfFile+'.dat');
    rewrite(F);
    m:= strtoint(inputbox('title','Сколько книг будет в новом файле?',''));
    for i := 1 to m do
    begin
      c.name:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ','').Replace('\n', '');
      c.author:=inputbox('title', 'ВВЕДИТЕ АВТОРА','');
      c.year:=strtoint(inputbox('title', 'ВВЕДИТЕ ГОД',''));
      Write(F, c);
    end;
    Close(F);
 end;
 procedure addLast(var F:fileOfBooks);
 var
    i,m: byte;
    c: book;
 begin
 Reset(F);
 seek(f,filesize(f));
 c.name:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ','').Replace('\n', '');
 c.author:=inputbox('title', 'ВВЕДИТЕ АВТОРА','');
 c.year:=strtoint(inputbox('title', 'ВВЕДИТЕ ГОД',''));
 Write(F, c);
 close(f);
 end;
 procedure sortP(var F:fileOfBooks);
 var i, j, n:integer;
     stud1, stud2:book;
 begin
 reset(f);
 n:=filesize(f);
 for i:=0 to n-1 do
     for j:=0 to n-2 do
     begin
          seek(f, j);
          read(f, stud1);
          read(f, stud2);
          if (stud1.author > stud2.author) then
          begin
               seek(f, j);
               write(f, stud2);
               write(f, stud1);
          end;
     end;
 close(f);
 end;
 procedure findMoreThan1(var SG:TStringGrid; var F:fileOfBooks);
 var
    max: string;
    c: book;
    arr1:array[1..20] of integer;
    arr2:array[1..20] of book;
    i,j,size:integer;
 begin
    Reset(F);
    for i:=1 to 20 do
    begin
         arr1[i]:=0;
         arr2[i].author:='';
    end;
    size:=0;
    while not EOF(F) do
    begin
    Read(F, c);
    i:=1;
    while ((arr2[i].author<>'') and (arr2[i].author<>c.author)) and (c.year>2018) do
          begin
               i:=i+1;
          end;
    arr2[i]:=c;
    arr1[i]:=arr1[i]+1;
    if i>size then size:=i;
    end;
    SG.RowCount:=size+1;
    SG.ColCount:=2;
    SG.Cells[0,0]:='N';
    SG.Cells[1,0]:='Автор';
    j:=1;
    for i:=1 to size do begin
        if arr1[i]>1 then
           begin
                SG.Cells[1,j]:=arr2[i].author;
                SG.Cells[0,j]:=inttostr(j);
                j:=j+1
           end;
    end;
    SG.RowCount:=j;
 end;
 procedure findByAuthorP(var SG:TStringGrid; var F:fileOfBooks);
 var
 i:integer;
 s:string;
 c:book;
 begin
    s:=inputbox('title','Введите имя автора','');
    Reset(F);
    SG.ColCount:=4;
    SG.RowCount:=FileSize(f)+1;
    SG.cells[0,0]:='N';
    SG.cells[1,0]:='Название';
    SG.cells[2,0]:='Автор';
    SG.cells[3,0]:='Год';

    i:=1;
    while not EOF(F) do
      begin
         Read(F, c);
         if c.author=s then begin
            SG.cells[0,i]:=inttostr(i);
            SG.cells[1,i]:=c.name;
            SG.cells[2,i]:=c.author;
            SG.cells[3,i]:=inttostr(c.year);
            i:=i+1;
         end;
      end;
    SG.RowCount:=i;
    Close(F);

 end;

 procedure findByYearP(var SG:TStringGrid; var F:fileOfBooks);
 var
 i:integer;
 s:integer;
 c:book;
 begin
    s:=strtoint(inputbox('title','Введите год',''));
    Reset(F);
    SG.ColCount:=4;
    SG.RowCount:=FileSize(f)+1;
    SG.cells[0,0]:='N';
    SG.cells[1,0]:='Название';
    SG.cells[2,0]:='Автор';
    SG.cells[3,0]:='Год';

    i:=1;
    while not EOF(F) do
      begin
         Read(F, c);
         if c.year=s then begin
            SG.cells[0,i]:=inttostr(i);
            SG.cells[1,i]:=c.name;
            SG.cells[2,i]:=c.author;
            SG.cells[3,i]:=inttostr(c.year);
            i:=i+1;
         end;
      end;
    SG.RowCount:=i;
    Close(F);
 end;

end.

