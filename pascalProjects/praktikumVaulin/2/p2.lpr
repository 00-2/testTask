program p2;
uses SysUtils,Math;

var c:integer;
x,x0:real;
begin
     write('x=');read(x);
     if x<-3 then begin x0:=-1/x;writeln(x0); end;
     if (x>=-3) and (x<0)  then begin x0:=sqrt(-x);writeln(x0);end;
     if (x>=0) and (x<1) then begin x0:=x*x;writeln(x0); end;
     if (x>=1)  then begin x0:=1-x; writeln(x0) ;end;
     
     if x<-3 then writeln(-1/x);
     if (x>=-3) and (x<0)  then writeln(sqrt(-x));
     if (x>=0) and (x<1) then writeln(x*x);
     if (x>=1)  then writeln(1-x);

     case x of 
     -1000..-3 : writeln(-1/x);break;
     -3..0: writeln(sqrt(-x)); break;
     0..1: writeln(x*x); break;
     1:1000:writeln(1-x); break;
     else  writeln ('Error')
     end;
     
     case n of
        1..4: writeln ('Младшие классы.');
        5..8: writeln ('Средняя школа.');
        9,11: writeln ('Старшие классы. Выпускной.');
        10: writeln ('Старшие классы.');
        else writeln ('Error')
    end;
 
     
end.

