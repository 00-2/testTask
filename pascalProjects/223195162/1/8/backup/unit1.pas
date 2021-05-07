unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Rabota: TButton;
    Zapolnit: TButton;
    Dobavit: TButton;
    Udalit: TButton;
    ComboBox: TComboBox;
    Edit: TEdit;
    ListBox: TListBox;
    procedure RabotaClick(Sender: TObject);
    procedure ZapolnitClick(Sender: TObject);
    procedure DobavitClick(Sender: TObject);
    procedure UdalitClick(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ZapolnitClick(Sender: TObject);
begin
  ComboBox.Items.Clear;             //Delete all existing strings
  ComboBox.Items.Add('test');//-(not pal)
  ComboBox.Items.Add('ABBA');//+(pal)
  ComboBox.Items.Add('salas');//+(pal)
  ComboBox.Items.Add('2tnt2');//-(pal,but numbers)
end;

procedure TForm1.RabotaClick(Sender: TObject);
var i,j:integer;
  tmp:string;
  flag:boolean;
begin
   for i:=0 to Combobox.Items.Capacity-1 do begin
       Flag:=True;
       tmp:=Combobox.Items[i];
       for j:=1 to length(tmp) do begin
           //ПАЛИНДРОМ + ПРОВЕРКА НА БУКВЫ
           if not ((tmp[length(tmp)-j+1]=tmp[j]) and (tmp[j] in ['A'..'Z','a'..'z'])) then
              flag:=False;
       end;
       if flag=True then ListBox.Items.Add(Combobox.Items[i]);
   end;
end;



procedure TForm1.DobavitClick(Sender: TObject);
var editText:string;
begin
   editText:=edit.text;//текст из edit
   ComboBox.Items.Add(editText);
end;

procedure TForm1.UdalitClick(Sender: TObject);
var editText:string;
    index:integer;
begin
   editText:=edit.text;//текст из edit
   index:=Combobox.Items.IndexOf(editText);//находит позицию текста из edita, -1, если такого нет
   if not(index = -1) then
      ComboBox.Items.Delete(index)
   else showmessage('ТАКОГО НЕТ');
end;


end.

