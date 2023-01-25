program project12;
const MAX_INTENTOS = 10; //Cantidad máxima de intentos.
      LARGO_CODIGO = 4; //El largo de los códigos.
      PRIMERA_LETRA = 'A'; //  Letra inicial del rango disponible.
      ULTIMA_LETRA = 'H'; //Última letra del rango disponible.

type
      //Subrango para restringir las letras que se pueden usar.
      TLetras= PRIMERA_LETRA..ULTIMA_LETRA;
      //Arreglo de letras con cantidad de celdas LARGO_CODIGO.
      TCodigo= array[1..LARGO_CODIGO] of TLetras;
var   g, h, i, j, k, m, indice, regulares, buenos: byte;
      letra: char;
      ganaste, perdiste: boolean;
      a, b: TCodigo;
      evaluadasP, evaluadasA: array[1..LARGO_CODIGO] of boolean;

begin
ganaste:=false;
perdiste:=false;

{Se muestra el mensaje de entrada}
write('MasterMind V1.0'+#13#10);
writeln('Dispones de ',MAX_INTENTOS,' intentos para adivinar el codigo.');

//Se inicializan los arreglos de tipo boolean en false
for g:=1 to LARGO_CODIGO do begin
evaluadasP[g]:=false;
evaluadasA[g]:=false;
end;

{Se asignan los valores al arreglo "a"}
randomize;
for I:=1 to LARGO_CODIGO do begin
  indice:= random(ord(ULTIMA_LETRA)-ord(PRIMERA_LETRA)+1)+ord(PRIMERA_LETRA);
  letra:=chr(indice);
  a[i]:= letra;
  end;

{Se muestra el codigo compuesto por los caracteres del arreglo "a"}
for i:=1 to LARGO_CODIGO do begin
  write(a[i]);
  end;
writeln;

{Se muestra el prompt que se repetira la cantidad de maximos intentos}
for h:=1 to MAX_INTENTOS do begin
Buenos:=0;//Se inicializa el contador de asiertos buenos en 0
Regulares:=0; //Se inicializa el contador de asiertos regulares en 0

write('Ingresa ',LARGO_CODIGO,' letras entre "',PRIMERA_LETRA,'" y "',ULTIMA_LETRA,'". Codigo ',H,' de ',MAX_INTENTOS,'>>');

{Modificacion V2.0}

{Se recorre el arreglo para leer letras y asignar buenos:}
 for i:=1 to LARGO_CODIGO do begin
  read(b[i]);
  if (A[I]=B[I]) then begin
   evaluadasP[I]:=true;
   evaluadasA[i]:=true;
   buenos+=1;
   end;
  end;

 for j:=1 to LARGO_CODIGO do begin
  if not evaluadasP[j] then begin
   for k:=1 to LARGO_CODIGO do begin
    if not evaluadasA[k] then begin
     if (a[j]=b[k]) then begin
     regulares+=1;
     evaluadasA[k]:= true;
     evaluadasP[j]:=true;
     end;
    end;
   end;
  end;
end;
{Fin de modificacion V2.0}



writeln('B: ',buenos,'  '+'R: ',regulares);

if buenos=4 then begin
writeln('EXCELENTE!!! Ganaste.');
ganaste:=true;
break;
end;

if (H=MAX_INTENTOS) and not ganaste then BEGIN
writeln('PERDISTE!!! El codigo era: ');
 for m:=1 to LARGO_CODIGO do begin
 write(a[m]);
 end;
 end;
READLN; READLN;
end;
READLN;
end.

