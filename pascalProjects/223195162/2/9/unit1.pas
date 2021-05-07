unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, crt;

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
  f : text;
  arr:array[1..20] of string;
  n:integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ZapolnitClick(Sender: TObject);
var
i:integer;
c:char;
s:string;
begin
  Assignfile(f, 'Alpha.txt');
  {$I-} reset(f);  {$I+}
  if IOResult <> 0 then
  begin
       Write('Файл не обнаружен');
  end
  else begin             //Delete all existing strings
  i:=1;
  n:=0;
  while not eof(f) do begin
        read (f, c);
        if (c=' ') then begin
            arr[i]:=s;
            s:='';
            inc(i);
        end
        else s:=s+c;
        end;
  end;
  if s<>'' then begin
    arr[i]:=s;
    s:='';
    inc(i);
  end;
  n:=i-1;
  for i:=1 to n do begin
      Combobox.Items.add(arr[i]);
  end;
end;

procedure TForm1.RabotaClick(Sender: TObject);
var i,j,tmpInt,Flag,alrdyFound:integer;
tmpString:string;
begin
   ListBox.Items.Clear;
   //сортировка
   for i:=1 to n-1 do begin
  {Внутренний цикл уже перебирает элементы и сравнивает между собой.}
  for j:=1 to n-i do begin
    {Если элемент, больше следующего, то меняем местами.}
    if length(arr[j])>length(arr[j+1]) then begin
      tmpString:=arr[j];
      arr[j]:=arr[j+1];
      arr[j+1]:=tmpString;
    end;
  end;
  end;
  alrdyFound:=0;
  for i:=1 to n do begin
       arr[i]:=trim(arr[i]);//обрезает пробелы с обеих сторон
       val(arr[i],tmpInt,Flag);
       if (Flag=0) and (alrdyFound=0) then
          begin
          ListBox.Items.add(floattostr(tmpInt/100));
          alrdyFound:=1;
          end
       else
    ListBox.Items.add(arr[i]);
  end;
end;




procedure TForm1.DobavitClick(Sender: TObject);
var editText:string;
begin
   editText:=edit.text;//текст из edit
   ComboBox.Items.Add(editText);
   n:=n+1;
   arr[n]:=editText;
end;

procedure TForm1.UdalitClick(Sender: TObject);
var editText:string;
    index,i:integer;
begin
   editText:=edit.text;//текст из edit
   index:=Combobox.Items.IndexOf(editText);//находит позицию текста из edita, -1, если такого нет
   if not(index = -1) then begin
      ComboBox.Items.Delete(index);
      for i:=index to n-1 do
          arr[i]:=arr[i+1];
      n:=n-1;
   end
   else showmessage('ТАКОГО НЕТ');
end;


end.

