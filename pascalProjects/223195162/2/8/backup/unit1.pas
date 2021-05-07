unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, crt;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
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
var i,tmpInt,Flag,sumNeg,countPos:integer;
begin
   ListBox.Items.Clear;
   SumNeg:=0;countPos:=0;
   for i:=1 to n do begin
       arr[i]:=trim(arr[i]);//обрезает пробелы с обеих сторон
       val(arr[i],tmpInt,Flag);
       if Flag=0 then
          begin
          if tmpInt>0 then countPos:=countPos+1
          else sumNeg:=sumNeg+tmpInt;
          ListBox.Items.add(arr[i]);
          end;
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

