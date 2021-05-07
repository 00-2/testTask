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
var maxw,maxh,w,h,x0,y0,tmp,r,a,b:integer;
begin
  maxw:=ClientWidth;
  maxh:=ClientHeight;
  tmp:=50;
  with Canvas do
  begin
Rectangle(0, maxh, maxw, 0);

Brush.Color:=clMaroon;
Ellipse(320+tmp,30+tmp,490-tmp,400-tmp);
Ellipse(120+tmp,30+tmp,300-tmp,400-tmp);

brush.color:=clCream;
Ellipse(335+tmp,40+tmp,480-tmp-20,380-tmp-50);
Ellipse(140+tmp,40+tmp,280-tmp-20,380-tmp-50);

brush.color:=clYellow;
Ellipse(150,500,450,100);

brush.color:=clMaroon;
Ellipse(170,200,190,270);
brush.color:=clMaroon;
Rectangle(200,350,300,220);
brush.color:=clMaroon;
Ellipse(280,230,400,280);

brush.color:=clMoneyGreen;
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

