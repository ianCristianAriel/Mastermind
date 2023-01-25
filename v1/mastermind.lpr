program masterMind_V1;
const MAX_INTENTOS = 10; //Cantidad máxima de intentos.
      LARGO_CODIGO = 4; //El largo de los códigos.
      PRIMERA_LETRA = 'A'; //  Letra inicial del rango disponible.
      ULTIMA_LETRA = 'H'; //Última letra del rango disponible.

type
      //Subrango para restringir las letras que se pueden usar.
      TLetras= PRIMERA_LETRA..ULTIMA_LETRA;
      //Arreglo de letras con cantidad de celdas LARGO_CODIGO. 
      TCodigo= array[1..LARGO_CODIGO] of TLetras;
var   i, j, indice, l, m, k, regulares, buenos: byte;
      letra: char;
      a, b: TCodigo;

begin
{Se muestra el mensaje de entrada}
write('MasterMind V1.0'+#13#10);
writeln('Dispones de 10 intentos para adivinar el codigo.');

{Se asignan los valores al arreglo "a"}
randomize;
  for i:=1 to LARGO_CODIGO do begin
  indice:= random(ord(ULTIMA_LETRA)-ord(PRIMERA_LETRA)+1)+ord(PRIMERA_LETRA);
  letra:=chr(indice);

  j:=1;
  while j<i do begin
  if letra=a[j] then begin
  j:=1;
  indice:= random(ord(ULTIMA_LETRA)-ord(PRIMERA_LETRA)+1)+ord(PRIMERA_LETRA);
  letra:=chr(indice);
  end else
  j+=1;
  end;
  a[i]:= letra;
end;

{Se muestra el codigo compuesto por los caracteres del arreglo "a"}
for i:=1 to LARGO_CODIGO do begin
  write(a[i]);
  end;
writeln;

{Se muestra el prompt que se repetira la cantidad de maximos intentos}
for i:=1 to MAX_INTENTOS do begin







writeln('B: ',buenos,'  '+'R: ',regulares);

if buenos=4 then begin
writeln('EXCELENTE!!! Ganaste.');
BREAK;
end;
READLN;
end;
readln;
end.
