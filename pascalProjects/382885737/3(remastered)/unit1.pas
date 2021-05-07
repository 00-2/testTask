unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, Menus,Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Add: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenFile: TMenuItem;
    CreateFile: TMenuItem;
    Sort: TMenuItem;
    Find2019: TMenuItem;
    FindByAuthor: TMenuItem;
    FindByYear: TMenuItem;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure AddClick(Sender: TObject);
    procedure CreateFileClick(Sender: TObject);
    procedure Find2019Click(Sender: TObject);
    procedure FindByAuthorClick(Sender: TObject);
    procedure FindByYearClick(Sender: TObject);
    procedure OpenFileClick(Sender: TObject);
    procedure SortClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  TF:fileOfBooks;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.OpenFileClick(Sender: TObject);
begin
if OpenDialog1.Execute then
   begin
        AssignFile(TF, OpenDialog1.FileName);
        print(StringGrid1,TF);
   end;
end;

procedure TForm1.SortClick(Sender: TObject);
begin
     sortP(TF);
     print(StringGrid1,TF);
end;

procedure TForm1.CreateFileClick(Sender: TObject);
begin
  createFileP(tf);
  print(StringGrid1,TF);
end;

procedure TForm1.Find2019Click(Sender: TObject);
begin
    findMoreThan1(StringGrid2,TF);
end;

procedure TForm1.FindByAuthorClick(Sender: TObject);
begin
    findByAuthorP(StringGrid2,TF);
end;

procedure TForm1.FindByYearClick(Sender: TObject);
begin
    findByYearP(StringGrid2,TF);
end;

procedure TForm1.AddClick(Sender: TObject);
begin
  addLast(TF);
  print(StringGrid1,TF);
end;

end.

