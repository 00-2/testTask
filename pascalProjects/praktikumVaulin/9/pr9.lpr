Program pr9;                         { Сортировки выбором }
  var a,aTmp : array [1 .. 100] of integer;    
        tmp,n,i,j, nmax,nmin, buf, ctd : integer;
begin
  write('n:');readln(n);

  writeln('Введите ', n, ' элементов массива');    
  for i := 1 to n do read(a[i]);
  
  for i:=1 to n do aTmp[i]:=a[i];
  
  writeln('Сортировка пузырьком по возрастанию');    
  for i := 1 to n-1 do
    for j := 1 to n-i do
      if aTmp[j] > aTmp[j+1] then
        begin
          {обмен элементов}
          tmp := aTmp[j];
          aTmp[j] := aTmp[j+1];
          aTmp[j+1] := tmp;
        end;
  for i := 1 to n do write(aTmp[i]:5);
  writeln;
  writeln('Сортировка пузырьком по убыванию');    
  for i := 1 to n-1 do
    for j := 1 to n-i do
      if aTmp[j] < aTmp[j+1] then
        begin
          {обмен элементов}
          tmp := aTmp[j];
          aTmp[j] := aTmp[j+1];
          aTmp[j+1] := tmp;
        end;
  for i := 1 to n do write(aTmp[i]:5);
  writeln;
  writeln('Сортировка методом наибольшего(по убыванию)');
  for i := 1 to n - 1 do begin      { просмотр массива n-1 раз }        
      nmax := i;        
      for j := i + 1 to n do            { поиск максимума }            
         if aTmp[j] > aTmp[nmax] then nmax := j;            
      buf := aTmp[i];                  { перестановка }            
      aTmp[i]:= aTmp[nmax];             { двух }            
      aTmp[nmax]:= buf;            { элементов массива }        
  end;        
  for i := 1 to n do write(aTmp[i]:5);
  writeln('Наибольшее ',aTmp[1]);
  
  writeln('Сортировка методом наименьшего(по возрастанию)');
  for i := 1 to n - 1 do begin      { просмотр массива n-1 раз }        
      nmin := i;        
      for j := i + 1 to n do            { поиск минимума }            
         if aTmp[j] < aTmp[nmin] then nmin := j;            
      buf := aTmp[i];                  { перестановка }            
      aTmp[i]:= aTmp[nmin];             { двух }            
      aTmp[nmin]:= buf;            { элементов массива }        
  end;        
  for i := 1 to n do write(aTmp[i]:5);
  writeln('Наименьшее ',aTmp[1]);
  
  readln;
end.
