program mastermindv1;
const MAX_INTENTOS = 10; //Cantidad máxima de intentos.
      LARGO_CODIGO = 4; //El largo de los códigos.
      PRIMERA_LETRA = 'A'; //  Letra inicial del rango disponible.
      ULTIMA_LETRA = 'H'; //Última letra del rango disponible.

type
      //Subrango para restringir las letras que se pueden usar.
      TLetras= PRIMERA_LETRA..ULTIMA_LETRA;
      //Arreglo de letras con cantidad de celdas LARGO_CODIGO. 
      TCodigo= array[1..LARGO_CODIGO] of TLetras;
var   i, j, m, indice, k, regulares, buenos: byte;
      letra: char;
      ganaste: boolean;
      a, b: TCodigo;


begin
ganaste:=false;
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
Buenos:=0;//Se inicializa el contador de asiertos buenos en 0
Regulares:=0; //Se inicializa el contador de asiertos regulares en 0
write('Ingresa ',LARGO_CODIGO,' letras entre "',PRIMERA_LETRA,'" y "',ULTIMA_LETRA,'". Codigo ',i,' de ',MAX_INTENTOS,'>>'); //Se ingresa el codigo que se copiara al arreglo "b"

for j:=1 to LARGO_CODIGO do begin
read(b[j]);
 for k:=1 to LARGO_CODIGO do begin
  if k=j then begin
   if (a[k]=b[k]) then begin
    buenos+=1;
   end;
  end;
  if k<>j then begin
   if a[k]=b[j] then begin
   regulares+=1;
   end;
 end;
end;
end;

writeln('B: ',buenos,'  '+'R: ',regulares);

if buenos=4 then begin
writeln('EXCELENTE!!! Ganaste.');
ganaste:=true;
BREAK;
end;

if (i=MAX_INTENTOS) and not ganaste then begin
writeln('PERDISTE!!! El código era: ');
for m:=1 to LARGO_CODIGO do begin
write(a[m]);
end;
end;
READLN;
end;
readln;READLN;
end.
