program project1;
{$mode objfpc}{$H+}
uses
{$IFDEF UNIX}{$IFDEF UseCThreads}
cthreads,
{$ENDIF}{$ENDIF}
Classes, unit1
{ you can add units after this };

var
  A, B, C: fileOfBook;
  m: byte;
  key:string;

begin
  Assign(A, 'Alpha.dat');
  Assign(B, 'Beta.dat');
  Assign(C, 'Omega.dat');
  repeat
  writeln('Что вы хотите сделать?');
  writeln('1 - создать файл записей с данными о книгах');
  writeln('2 - вывести содержимое файла');
  writeln('3 - добавить книгу в файл');
  writeln('4 - найти авторов, которые выпустили >1 книги с 2019 года ');
  writeln('5 - отсортировать книги по фио автора');
  writeln('6 - найти, вывести и скопировать в др. файл книги,названия кот. начинаются с введенной буквы');
  writeln('7 - найти, вывести и скопировать в др. файл книги,год кот совпадает с введенным');
  writeln('8 - закончить выполнение программы');
    readln(key);
    case key of
      '1': input(A, m);
      '2': output(A);
      '3': add(A, m);
      '4': searchMAX(A);
      '5': sort(A);
      '6': searchByName(A,B);
      '7': searchByYear(A,C);
     '8': exit;
    end;
    readln;
  until key='8';
end.
