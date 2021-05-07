unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenueFile: TMenuItem;
    MenueOpen: TMenuItem;
    MenuClose: TMenuItem;
    MenuCreate: TMenuItem;
    MenuSave: TMenuItem;
    MenuSaveAs: TMenuItem;
    MenuExit: TMenuItem;
    MenuWork: TMenuItem;
    MenuWorkA: TMenuItem;
    MenuWorkB: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuCloseClick(Sender: TObject);
    procedure MenuCreateClick(Sender: TObject);
    procedure MenueFileClick(Sender: TObject);
    procedure MenueOpenClick(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuSaveAsClick(Sender: TObject);
    procedure MenuSaveClick(Sender: TObject);
    procedure MenuWorkAClick(Sender: TObject);
    procedure MenuWorkBClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  S: string;

implementation

{$R *.lfm}

{ TForm1 }




procedure TForm1.MenueFileClick(Sender: TObject);
begin

end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  //Создание формы
  Memo1.Clear;
  Memo1.Align := alClient;
  Memo1.Font.Name := 'Courier';
  S := '';
  Memo1.Modified := False;
end;


procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.MenuCreateClick(Sender: TObject);
begin
  //файл.создать
  if  (Memo1.Modified = False) then
  begin
    Memo1.Text := '';
    S := '';
    Form1.Caption := 'Form1';
  end
  else
  begin
    case MessageDlg('Текст был изменен. Сохранить данные' +
        ' в файле по выбору?', mtConfirmation,
        [mbYes, mbNo, mbCancel], 0) of
      mrYes:
      begin
        MenuSaveAsClick(Self);
        Memo1.Text := '';
        S := '';
        Form1.Caption := 'Form1';
        Memo1.Modified:= False;
      end;
      mrCancel: exit;
      mrNo:
      begin
        Memo1.Text := '';
        S := '';
        Form1.Caption := 'Form1';
        Memo1.Modified:= False;
      end;
    end;
  end;

end;



procedure TForm1.MenueOpenClick(Sender: TObject);
begin
  //Файл.открыть
  if Memo1.Modified = True then
  begin
    case MessageDlg('Текст был изменен. Сохранить данные' +
        ' в файле по выбору?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes:
      begin
        MenuSaveAsClick(Self);
      end;
      mrCancel: exit;
      mrNo: ;
    end;
  end;
  if Form1.OpenDialog1.Execute then
  begin
    S := OpenDialog1.FileName;
    Memo1.Lines.LoadFromFile(S);
    Memo1.Modified := False;
    Form1.Caption := 'Form1' + '  ' + S;
  end;
end;



procedure TForm1.MenuCloseClick(Sender: TObject);
begin
  //Файл.закрыть
if (Memo1.Modified = true) then
   case MessageDlg('Текст был изменен. Сохранить данные' +
        ' в файле по выбору?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes:
      begin
        MenuSaveAsClick(Self);
        Memo1.Text := '';
        S := '';
        Form1.Caption := 'Form1';
        Memo1.Modified:= False;
      end;
      mrCancel: exit;
      mrNo:
      begin
        Memo1.Text := '';
        S := '';
        Form1.Caption := 'Form1';
        Memo1.Modified:= False;
      end;
end
else begin
  Memo1.Text := '';
        S := '';
        Form1.Caption := 'Form1';
        Memo1.Modified:= False;
end;

end;




procedure TForm1.MenuSaveClick(Sender: TObject);
begin
  //Файл.сохранить
  if S = '' then
    MenuSaveAsClick(Self)
  else
  begin
    Memo1.Lines.SaveToFile(S);
    Memo1.Modified := False;
  end;
end;


procedure TForm1.MenuSaveAsClick(Sender: TObject);
begin
  //файл.сохранить как
  if Form1.SaveDialog1.Execute then
  begin
    S := SaveDialog1.FileName;
    Memo1.Lines.SaveToFile(S);
    Memo1.Modified := False;
    Form1.Caption := 'Form1' + ' ' + S;
  end;
end;


procedure TForm1.MenuExitClick(Sender: TObject);
begin
  //файл.выход
  if (S <> '') or (Memo1.Modified = False) then
    Close
  else
  begin
    case MessageDlg('Сохранить файл?', mtConfirmation,
        [mbYes, mbNo, mbCancel], 0) of
      mrYes:
      begin
        MenuSaveAsClick(Self);
        Close;
      end;
      mrCancel: exit;
      mrNo: ;
    end;
  end;
end;


procedure TForm1.MenuWorkAClick(Sender: TObject);
var

F1,F2:TextFile;
No,Noo:byte;
Gr:string[7];
FIO,surname:string[10];
O1,O2,O3:2..5;
Sname:string;

begin


case MessageDlg('Создать файл с однофамильцами?', mtConfirmation,
[mbYes,mbCancel], 0) of
      mrYes:
      begin
  AssignFile(F1,'data.txt');
  Reset(F1);
  Noo:=0;
  Sname:='WorkA.txt';
  AssignFile(F2,Sname);
  Rewrite(F2);
  writeln(F2,'   Студенты-однофамильцы:');
  Writeln(F2,' ');
  surname:=lowercase(inputbox('Title', '', 'surname'));
  while not eof(F1) do
        begin
        readln(F1,No,Gr,FIO,O1,O2,O3);
        writeln(o1);
        if (lowercase(Trim(FIO))=surname) then begin

           Noo:=Noo+1;
           writeln(F2,Noo:4,Gr:6,FIO:10,O1:3,O2:3,O3:3);
        end;
  end;
  CloseFile(F2);
  Form1.OpenDialog1.Execute;
  Sname:=Form1.OpenDialog1.FileName;
  Memo1.Text:='';
  Memo1.Lines.LoadFromFile(Sname);
  Memo1.Modified := False;
end;

  mrCancel: exit;
  end;
end;

procedure TForm1.MenuWorkBClick(Sender: TObject);
var
F1,F2:TextFile;
No,Noo,Count:byte;
Gr,SCount:string[6];
FIO:string[10];
O1,O2,O3:2..5;
Sname:string;
i,n:byte;

begin

case MessageDlg('Создать файл из студентов с низким ср баллом?', mtConfirmation,
[mbYes,mbCancel], 0) of
      mrYes:
      begin
  Noo:=0;
  AssignFile (F1,'data.txt');
  Reset(F1);
  Sname:='WorkB.txt';
  AssignFile(F2,Sname);
  Rewrite(F2);
  n:=strtoint(inputbox('title', '' ,'3'));
  writeln(F2,'   Список из',n ,' студентов с низким ср баллом:');
  Writeln(F2,' ');
for i:=6 to 15 do
  begin
  if n>0 then
     while not eof(F1) do
        begin
        readln(F1,No,Gr,FIO,O1,O2,O3);
        if ((o1+o2+o3)=i) then begin
           n:=n-1;
           Noo:=Noo+1;
           writeln(F2,Noo:4,Gr:6,FIO:10,O1:3,O2:3,O3:3);
        end;
        end;
     reset(f1);
  end;
  CloseFile(F2);


  Form1.OpenDialog1.Execute;
  Sname:=Form1.OpenDialog1.FileName;
  Memo1.Text:='';
  Memo1.Lines.LoadFromFile(Sname);
  Memo1.Modified := False;
end;

  mrCancel: exit;
  end;





end;




end.


