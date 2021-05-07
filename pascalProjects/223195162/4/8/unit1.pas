unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormResize(Sender: TObject);
var maxw,maxh,w,h,x0,y0,tmp:integer;
begin
  maxw:=ClientWidth;
  maxh:=ClientHeight;
  tmp:=50;
  with Canvas do
  begin
Rectangle(0, maxh, maxw, 0);

pen.Width:=20;
pen.Color:=clMaroon;
line(tmp, tmp, 300, 280);
line(ClientWidth, tmp, 300,280);
pen.Color:=clBlack;
pen.Width:=1;

brush.color:=clMaroon;
Ellipse(180,430,400,130);
brush.color:=clGreen;
Ellipse(250,240,200,310);
Ellipse(350,240,400,310);
brush.color:=clWhite;
Ellipse(240,270,220,300);
Ellipse(360,270,380,300);
brush.color:=clBlack;
Ellipse(270,330,330,370);
line(300,370,300,400);
Arc(300,280,120,220,-40,1);



line(240,230,220,150);
line(230,230,180,80);
line(220,230,180,150);

line(360,230,380,150);
line(370,230,430,80);
line(380,230,430,150);

  end;
end;

end.

