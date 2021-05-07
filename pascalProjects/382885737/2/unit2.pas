unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Dialogs;
type
  str=string[20];
  theRecord=record
  name,firm,taste: string[20];
  cost:integer;
  end;
  tmas=array[1..20] of theRecord;
  fileOfRecords=file of theRecord;
  procedure readFile(var arr:tmas; var n:integer; var A:fileOfRecords);
  procedure createFile(var arr:tmas;var n:integer; var A:fileOfRecords);
  procedure poisk (arr:tmas; n:integer; var c:theRecord);
  procedure addRecord(var arr:tmas; var n:integer);
  procedure delRecord(var arr:tmas; var n:integer);
  procedure correctRecord(var arr:tmas; n:integer);
  procedure exit(var arr:tmas; var n:integer;var A:fileOfRecords);
 implementation
 procedure readFile(var arr:tmas; var n:integer;var A:fileOfRecords);
 var i:integer;
   c: theRecord;
   begin
        i:=0;
        {$I-} reset(A);  {$I+}
        if IOResult <> 0 then
        begin
             ShowMessage('File not found, create first');
        end
        else
            begin
              Reset(A);
              while not EOF(A) do
              begin
                i:=i+1;
                Read(A, c);
                arr[i]:=c;
              end;
              Close(A);
              ShowMessage('Arr read');
            end;
   end;
 procedure createFile(var arr:tmas; var n:integer;var A:fileOfRecords);
 var i:integer;
   c:theRecord;
   begin
        Assign(A, 'Alpha.dat');
        Rewrite(A);
        for i:=1 to n do
            arr[i]:=c;
        n:=0;
        ShowMessage('File created');
   end;
 procedure poisk (arr:tmas; n:integer; var c:theRecord);
 var i:integer;
   tmp:integer;
   begin
        tmp:=-1;//
        for i:= 1 to n do
           if (arr[i].cost>tmp) then begin tmp:=arr[i].cost; c:=arr[i]; end;
   end;
 procedure addRecord(var arr:tmas; var n:integer);
 var i:integer;
     c:theRecord;
     s:string;
   begin
        n:=n+1;
        c.name:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ','').Replace('\n', '');
        c.firm:=inputbox('title', 'ВВЕДИТЕ ФИРМУ','');
        c.taste:=inputbox('title', 'ВВЕДИТЕ ВКУС:','');
        c.cost:=strtoint(inputbox('title', 'ВВЕДИТЕ ЦЕНУ',''));
        arr[n]:=c;


   end;
 procedure delRecord(var arr:tmas; var n:integer);
 var i,j:integer;
     s:string;
   begin
        s:=inputbox('title', 'Введите название, которое надо удалить', '');
        for i:=1 to n do begin
          if arr[i].name=s then begin
             for j:=i to n-1 do begin
               arr[j]:=arr[j+1];
             end;
             n:=n-1;
           end;
        end;
   end;

 procedure correctRecord(var arr:tmas; n:integer);
 var i:integer;
     c:theRecord;
     s:string;
   begin
        s:=inputbox('title', 'Введите название, которое надо корректировать', '');
        for i:=1 to n do begin
          if arr[i].name=s then begin
              c.name:=inputbox('title', 'ВВЕДИТЕ НАЗВАНИЕ','').Replace('\n', '');
              c.firm:=inputbox('title', 'ВВЕДИТЕ ФИРМУ','');
              c.taste:=inputbox('title', 'ВВЕДИТЕ ВКУС:','');
              c.cost:=strtoint(inputbox('title', 'ВВЕДИТЕ ЦЕНУ',''));
             arr[i]:=c;
             end;
        end;
   end;
 procedure exit(var arr:tmas; var n:integer;var A:fileOfRecords);
 var i:integer;
   begin
        Assign(A, 'Alpha.dat');
        rewrite(a);
        for i:=1 to n do begin
            write(a, arr[i]);
        end;
        showmessage('Работа завершена');
        halt;
   end;
end.

