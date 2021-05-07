unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Grids,
  Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    StringGrid1: TStringGrid;
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

var arr:tmas;
 n:integer;
 A:fileOfRecords;
 c:theRecord;


procedure TForm1.MenuItem1Click(Sender: TObject);
var i:integer;
begin
    readFile(arr, n, a);
    StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Альбом';
    StringGrid1.Cells[3,0]:='Время';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].album;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].time);
    end;
end;


procedure TForm1.MenuItem2Click(Sender: TObject);
var i:integer;
begin
    createFile(arr, n, a);
    StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Альбом';
    StringGrid1.Cells[3,0]:='Время';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].album;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].time);
    end;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var i:integer;
begin
    poisk(arr, n, c);
    if c.name<>'' then  begin
       Edit1.Text:=c.firm;
    end
    else
        Edit1.Text:='Не найдено';
  StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Альбом';
    StringGrid1.Cells[3,0]:='Время';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].album;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].time);
    end;


end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var i:integer;
begin
  addRecord(arr, n);
  StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Альбом';
    StringGrid1.Cells[3,0]:='Время';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].album;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].time);
    end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
var i:integer;
begin
     delRecord(arr,n);
     StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Альбом';
    StringGrid1.Cells[3,0]:='Время';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].album;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].time);
    end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var i:integer;
begin
     correctRecord(arr,n);
     StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Альбом';
    StringGrid1.Cells[3,0]:='Время';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].album;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].time);
    end;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
   exit(arr, n, a);
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
var i,j:integer;
begin
   for i:=1 to n do begin
       for j:=0 to 3 do begin
           StringGrid1.Cells[j,i]:='';
       end;
    end;
    StringGrid1.RowCount:=1;
end;



end.

