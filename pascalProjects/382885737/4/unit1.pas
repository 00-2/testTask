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
    FindByAuthor: TMenuItem;
    FindInDuration: TMenuItem;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure AddClick(Sender: TObject);
    procedure CreateFileClick(Sender: TObject);
    procedure FindByAuthorClick(Sender: TObject);
    procedure FindInDurationClick(Sender: TObject);
    procedure OpenFileClick(Sender: TObject);
    procedure SortClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  TF:fileOfPlayers;

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


procedure TForm1.FindByAuthorClick(Sender: TObject);
begin
    findByYearAndTeam(StringGrid2,TF);
end;

procedure TForm1.FindInDurationClick(Sender: TObject);
begin
    FindInDurationP(StringGrid2,TF);
end;

procedure TForm1.AddClick(Sender: TObject);
begin
  addFirst(TF);
  print(StringGrid1,TF);
end;

end.

