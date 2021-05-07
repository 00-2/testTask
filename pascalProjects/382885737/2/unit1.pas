unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Grids,
  ExtCtrls, Unit2,Unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    NaitiPoNazvaniu: TMenuItem;
    prochitat: TMenuItem;
    sozdat: TMenuItem;
    NaitiDorogoe: TMenuItem;
    Dobavit: TMenuItem;
    Udalit: TMenuItem;
    Redactir: TMenuItem;
    Vihod: TMenuItem;
    Ochistit: TMenuItem;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure NaitiPoNazvaniuClick(Sender: TObject);
    procedure prochitatClick(Sender: TObject);
    procedure sozdatClick(Sender: TObject);
    procedure NaitiDorogoeClick(Sender: TObject);
    procedure DobavitClick(Sender: TObject);
    procedure UdalitClick(Sender: TObject);
    procedure RedactirClick(Sender: TObject);
    procedure VihodClick(Sender: TObject);
    procedure OchistitClick(Sender: TObject);
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


procedure TForm1.prochitatClick(Sender: TObject);
var i:integer;
begin
    readFile(arr, n, a);
    StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Вкус';
    StringGrid1.Cells[3,0]:='Цена';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].taste;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].cost);
    end;
end;

procedure TForm1.NaitiPoNazvaniuClick(Sender: TObject);
var i:integer;
     c:theRecord;
     s:string;
begin
   s:=inputbox('title', 'Введите название мороженого, которое надо найти', '');
   for i:=1 to n do begin
          if arr[i].name=s then begin
             c:=arr[i];
             end;
   end;
   if c.name<>'' then  begin
       Form2 := TForm2.Create(Self);
       Form2.Show;
       Form2.StringGrid1.RowCount:=n+1;
       Form2.StringGrid1.ColCount:=4;
       Form2.StringGrid1.Cells[0,0]:='Название';
       Form2.StringGrid1.Cells[1,0]:='Фирма';
       Form2.StringGrid1.Cells[2,0]:='Вкус';
       Form2.StringGrid1.Cells[3,0]:='Цена';

       Form2.StringGrid1.Cells[0,1]:=c.name;
       Form2.StringGrid1.Cells[1,1]:=c.firm;
       Form2.StringGrid1.Cells[2,1]:=c.taste;
       Form2.StringGrid1.Cells[3,1]:=inttostr(c.cost);
       if c.name = 'strawberry'   then begin form2.Image1.Picture.LoadFromFile('strawberry.jpeg');
       end;
       if c.name = 'chocolate'   then begin form2.Image1.Picture.LoadFromFile('chocolate.jpg');
       end;
       if c.name = 'vanilla'   then begin form2.Image1.Picture.LoadFromFile('vanilla.png');
       end;
       form2.Image1.Proportional:=True;
       form2.Image1.Stretch:=True;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     Form2 := TForm2.Create(Self);
     Form2.Show;
     Form2.StringGrid1.RowCount:=2;
     Form2.StringGrid1.ColCount:=4;
     Form2.StringGrid1.Cells[0,0]:='Фамилия';
     Form2.StringGrid1.Cells[1,0]:='Имя';
     Form2.StringGrid1.Cells[2,0]:='Отчество';
     Form2.StringGrid1.Cells[3,0]:='Группа';
     Form2.StringGrid1.Cells[0,1]:='Высоцкий';
     Form2.StringGrid1.Cells[1,1]:='Глеб';
     Form2.StringGrid1.Cells[2,1]:='Витальевич';
     Form2.StringGrid1.Cells[3,1]:='МТ6-11';
     form2.Image1.Picture.LoadFromFile('stud.jpg');
     form2.Image1.Proportional:=True;
     form2.Image1.Stretch:=True;
end;


procedure TForm1.sozdatClick(Sender: TObject);
var i:integer;
begin
    createFile(arr, n, a);
    StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Вкус';
    StringGrid1.Cells[3,0]:='Цена';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].taste;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].cost);
    end;
end;

procedure TForm1.NaitiDorogoeClick(Sender: TObject);
var i:integer;
begin
    poisk(arr, n, c);
    if c.name<>'' then  begin
       edit1.text:=c.name;
       Form2 := TForm2.Create(Self);
       Form2.Show;
       Form2.StringGrid1.RowCount:=n+1;
       Form2.StringGrid1.ColCount:=4;
       Form2.StringGrid1.Cells[0,0]:='Название';
       Form2.StringGrid1.Cells[1,0]:='Фирма';
       Form2.StringGrid1.Cells[2,0]:='Вкус';
       Form2.StringGrid1.Cells[3,0]:='Цена';

       Form2.StringGrid1.Cells[0,1]:=c.name;
       Form2.StringGrid1.Cells[1,1]:=c.firm;
       Form2.StringGrid1.Cells[2,1]:=c.taste;
       Form2.StringGrid1.Cells[3,1]:=inttostr(c.cost);
    end
    else
    Edit1.Text:='Не найдено';
    StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Вкус';
    StringGrid1.Cells[3,0]:='Цена';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].taste;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].cost);
    end;
    if c.name = 'strawberry'   then begin form2.Image1.Picture.LoadFromFile('strawberry.jpeg');
       end;
       if c.name = 'chocolate'   then begin form2.Image1.Picture.LoadFromFile('chocolate.jpg');
       end;
       if c.name = 'vanilla'   then begin form2.Image1.Picture.LoadFromFile('vanilla.png');
       end;
       form2.Image1.Proportional:=True;
       form2.Image1.Stretch:=True


end;

procedure TForm1.DobavitClick(Sender: TObject);
var i:integer;
begin
  addRecord(arr, n);
  StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Вкус';
    StringGrid1.Cells[3,0]:='Цена';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].taste;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].cost);
    end;
end;

procedure TForm1.UdalitClick(Sender: TObject);
var i:integer;
begin
     delRecord(arr,n);
     StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Вкус';
    StringGrid1.Cells[3,0]:='Цена';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].taste;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].cost);
    end;
end;

procedure TForm1.RedactirClick(Sender: TObject);
var i:integer;
begin
     correctRecord(arr,n);
     StringGrid1.RowCount:=n+1;
    StringGrid1.ColCount:=4;
    StringGrid1.Cells[0,0]:='Название';
    StringGrid1.Cells[1,0]:='Фирма';
    StringGrid1.Cells[2,0]:='Вкус';
    StringGrid1.Cells[3,0]:='Цена';
    for i:=1 to n do begin
        StringGrid1.Cells[0,i]:=arr[i].name;
        StringGrid1.Cells[1,i]:=arr[i].firm;
        StringGrid1.Cells[2,i]:=arr[i].taste;
        StringGrid1.Cells[3,i]:=inttostr(arr[i].cost);
    end;
end;

procedure TForm1.VihodClick(Sender: TObject);
begin
   exit(arr, n, a);
end;

procedure TForm1.OchistitClick(Sender: TObject);
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

