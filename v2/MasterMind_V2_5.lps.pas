program MasterMindV2_5;

const MAX_INTENTOS = 10; //Cantidad máxima de intentos.
      LARGO_CODIGO = 4; //El largo de los códigos.
      PRIMERA_LETRA = 'A'; //  Letra inicial del rango disponible.
      ULTIMA_LETRA = 'H'; //Última letra del rango disponible.

type
      TLetras= PRIMERA_LETRA..ULTIMA_LETRA;//Subrango para restringir las letras que se pueden usar.
      TCodigo= array[1..LARGO_CODIGO] of TLetras;//Arreglo de letras con cantidad de celdas LARGO_CODIGO.
      Evaluadas= array[1..LARGO_CODIGO] of boolean;
var   i, intento, regulares, buenos: byte;
      ganaste: boolean;
      Pensador, Adivinador: TCodigo;
      evaluadasP, evaluadasA: evaluadas;

procedure asignarValores();
var indice, i: byte;
    letra: char;

begin
randomize;
for I:=1 to LARGO_CODIGO do begin
  indice:= random(ord(ULTIMA_LETRA)-ord(PRIMERA_LETRA)+1)+ord(PRIMERA_LETRA);
  letra:=chr(indice);
  pensador[i]:= letra;
  end;
end;

procedure variablesDefault();
var i:byte;
begin

regulares:=0;
buenos:=0;

for i:=1 to LARGO_CODIGO do begin
evaluadasP[i]:=false;
evaluadasA[i]:=false;
end;

end;

function verificarEntrada(VAR arrAdivinador: TCodigo):boolean;
var iteracion, j: byte;
begin

//Error, lee dos vece mas el arreglo y muestra el mensaje de error.
iteracion:=0;
for j:=1 to LARGO_CODIGO do begin
read(arrAdivinador[j]);

if (arrAdivinador[j]<PRIMERA_LETRA) or (arrAdivinador[j]>ULTIMA_LETRA) then begin
 result:=false;
 exit;
 end;

iteracion+=1;
end;
READLN;

if (iteracion<>LARGO_CODIGO) then begin
result:=false;
exit;
end;

result:=true;

end;

procedure notas();
var i, j, k:byte;

begin

for i:=1 to LARGO_CODIGO do begin
  if (pensador[I]=adivinador[I]) then begin
   evaluadasP[I]:=true;
   evaluadasA[i]:=true;
   buenos+=1;
   end;
  end;

 for j:=1 to LARGO_CODIGO do begin
  if not evaluadasP[j] then begin
   for k:=1 to LARGO_CODIGO do begin
    if not evaluadasA[k] then begin
     if (pensador[j]=adivinador[k]) then begin
     regulares+=1;
     evaluadasA[k]:= true;
     evaluadasP[j]:=true;
     end;
    end;
   end;
  end;
end;

 writeln('Buenos: ',buenos,' Regulares: ',regulares);

end;

begin
ganaste:=false;

{Asigna los valores al arreglo del pensador y llama al procedimeto que deja los indicadores en default}
asignarValores();

{Se ingresa el codigo y se verifica los caracteres ingresados}
for intento:=1 to MAX_INTENTOS do begin

variablesDefault();

write('Ingresa ',LARGO_CODIGO,' letras entre "',PRIMERA_LETRA,'" y "',ULTIMA_LETRA,'". Codigo ',intento,' de ',MAX_INTENTOS,'>>');
while not verificarEntrada(adivinador) do begin
READLN;
variablesDefault();
write('Error. El codigo no es valido. Ingresa otro con ',LARGO_CODIGO,' letras entre ',PRIMERA_LETRA,' y ',ULTIMA_LETRA,'>>');
end;

{Se entregan buenos y regulares}
notas();

if (buenos=LARGO_CODIGO) then begin
writeln('Ganaste!!');
ganaste:= true;
break;
end;

end;

if (intento=MAX_INTENTOS) and not ganaste then BEGIN
writeln('PERDISTE!!! El codigo era: ');
 for i:=1 to LARGO_CODIGO do begin
 write(pensador[i]);
 end;
 end;

readln;

end.
