program pr8;

type matrixType:array of array of integer;

procedure writeM(var matrix:matrixType;n:integer;m:integer);
var
   i,j:integer;
begin
  for i:=1 to n do
      begin
      for j:=1 to m do
          write(matrix[i,j], ' ');
      writeln;
      end;
end;

procedure readM(var matrix:matrixType;n:integer;m:integer);
var
   i,j:integer;
begin
  for i:=1 to n do
      begin
      for j:=1 to m do
          read(matrix[i,j]);
      writeln;
      end;
end;

procedure readSize(var n:integer;m:integer);
begin
  writeln('Введите n,m');
  readln(n,m);
end;

procedure writeMatrixWithArrays(var matrix:matrixType;n:integer;m:integer);
var
   i,j:integer;
   arrM[m], arrN[n]:array of integer;
begin
  for i:=1 to n do
      begin
      for j:=1 to m do
          begin
          arrM[j]:= matrix[i,j];
          write(matrix[i,j], ' ');
          end;
      for j:=1 to m do write(arrM[j], ' ');
      writeln;
      end;
  for j:=1 to m do
      begin
      for i:=1 to n do
          begin
          arrN[i]:=0
          end;
      end;
end;

var
   matrix:matrixType;
   i,j,m,n:integer;

begin

end.

