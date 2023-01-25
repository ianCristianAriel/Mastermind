program MasterMindV3_ModLetras;
uses
sysutils;

const
MAX_INTENTOS = 10; //Cantidad máxima de intentos.
LARGO_CODIGO = 4; //El largo de los códigos.
PRIMERA_LETRA = 'A'; //Letra inicial del rango disponible.
ULTIMA_LETRA = 'H'; //Última letra del rango disponible.

type
TLetras= PRIMERA_LETRA..ULTIMA_LETRA;//Subrango para restringir las letras que se pueden usar.
TCodigo= array[1..LARGO_CODIGO] of TLetras;//Arreglo de letras con cantidad de celdas LARGO_CODIGO.
TRegistroNota = record  //Contiene un código y las notas que éste recibió.
  codigo : TCodigo;
  b, r: integer;
end;
THistoria = record //Un arreglo de TRegistroNota para guardar los códigos y sus notas, implementado como arreglo con tope.
  info : array [1..MAX_INTENTOS] of TRegistroNota;
  tope : 0..MAX_INTENTOS;
end;

var codigo: TCodigo;
    esA: boolean;
    historia, HVacia:THistoria;
    EMensaje: string;
    buenos, regulares, NumeroHistoriaVacia, intento: byte;
    espacio: char;

//Se colocan las variables en valor por defecto
procedure variablesDef();
{acomodar de acuerdo al numero de intento}
begin

historia.tope:=MAX_INTENTOS;

NumeroHistoriaVacia:=0;

codigo:='';

EMensaje:='';

end;

// 1. Generar un primer código al azar.
procedure generarCodigo(var codigo: TCodigo);
var i, indice:byte;
begin
randomize;
for i:=1 to LARGO_CODIGO DO BEGIN
  indice:= random(ord(ULTIMA_LETRA)-ord(PRIMERA_LETRA)+1)+ord(PRIMERA_LETRA);
  codigo[i]:=chr(indice);
  end;
end;

// 2. Mostrar el código al usuario.
procedure imprimirCodigo(codigo: TCodigo);
begin
  write(codigo);
end;

//3. Leer las notas.
function leerNotas(var b, r: byte; var errorMessage: string): boolean;
begin

read(b); read(espacio); read(r);
readln;

if ((b < 0) or (r < 0) ) or ((b > LARGO_CODIGO) or (r > LARGO_CODIGO)) then begin
result:=false;
errorMessage:='ERROR: Ingresa solo dos numeros enteros entre 0 y '+INTTOSTR(LARGO_CODIGO)+' separados por un espacio en blanco.';
writeln(errorMessage);
writeln;
b:=0; r:=0;
exit;
end;

if ((b+r)>LARGO_CODIGO) or ((b=(LARGO_CODIGO-1)) and (r>=1)) then begin
result:=false;
errorMessage:='ERROR: Las notas no son correctas, por favor verifica los valores.';
writeln(errorMessage);
writeln;
b:=0; r:=0;
exit;
end;

result:=true;
end;

// 4. Guardar el código con las notas recibidas en la historia.
function esHistoriaVacia(h: THistoria): boolean;
//var i:byte;
begin
 NumeroHistoriaVacia+=1;
 result:=true;
{for i:=low(h.tope) to high(h.tope) do begin
   NumeroHistoriaVacia+=1;
   if (h.tope=0) then begin
    result:=true;
    break;
    end;
   end;}

end;

procedure guardarNota(var h: THistoria; codigo: TCodigo; buenos, regulares: integer);

begin

 h.info[NumeroHistoriaVacia].codigo:= codigo;
 h.info[NumeroHistoriaVacia].b:= buenos;
 h.info[NumeroHistoriaVacia].r:= regulares;

end;

//5. Generar códigos sucesivos hasta encontrar uno que al compararse con los códigos de la historia obtenga exactamente las mismas notas.
function crearHistoria(): THistoria;
begin
result.tope:=0;
end;

function esAdecuado(codigo: TCodigo; h: THistoria): boolean; forward;
procedure siguienteCodigo(var codigo: TCodigo);
var i, i1, i2, i3, i4, no: byte;
    c1, c2, c3, c4:char;

begin
for i:=LARGO_CODIGO downto 1 do begin
  if (i=LARGO_CODIGO div LARGO_CODIGO) then begin
  {Cambie las letras en el rango TLetras sumando 1 por cada interacion, partiendo
  y terminando en la letra actual que se encuentra en la posicion del codigo y volver
  a la primera letra si esta en la ultima del rango TLetras}




  {c1:=codigo[i];
  for c1 in TLetras do begin
    codigo[i]:=c1;

    Porque la letra c1 simpre es la misma, al volver a iterar}
    if esAdecuado(codigo, historia) then exit;

    if (i<=(LARGO_CODIGO div LARGO_CODIGO) +1) then begin

    {c2:=codigo[(LARGO_CODIGO div LARGO_CODIGO)+1];
    for c2 in TLetras do begin
      codigo[(LARGO_CODIGO div LARGO_CODIGO)+1]:=c2;

      Porque la letra c2 simpre es la misma, al volver a iterar}
      if esAdecuado(codigo, historia) then exit;

      if (i<=(LARGO_CODIGO div LARGO_CODIGO) +2) then begin
      {c3:=codigo[(LARGO_CODIGO div LARGO_CODIGO) +2];
      for c3 in TLetras do begin
        codigo[(LARGO_CODIGO div LARGO_CODIGO) +2]:= c3;

        Porque la letra c3 simpre es la misma, al volver a iterar}}
        if esAdecuado(codigo, historia) then exit;

        if (i<=(LARGO_CODIGO div LARGO_CODIGO)+3) then
        {c4:=codigo[(LARGO_CODIGO div LARGO_CODIGO)+3];
        for c4 in TLetras do begin
          codigo[(LARGO_CODIGO div LARGO_CODIGO)+3]:=c4;

          Porque la letra c4 simpre es la misma, al volver a iterar}
          if esAdecuado(codigo, historia) then exit;
        end;
      end;
    end;
    end;
  end;
    end;
  end;
  end; end;

{Se realiza una ramificacion de opciones a modo de potencia (TLetras):
1.Se comprueba cambiando uno a uno las letras en TLetras
2.Se cambia la ultima letra, y por cada cambio cambian las otras una vez
3.Por cada cambio de la ultima letra, cambia la segunda T veces y las demascambian T veces cada cambio de la tercera
4.A demas de lo anterior ahora la segunda letra tambien cambia T veces las veces que cambia la tercer letra}


procedure calcularNota(adivinador, pensador: TCodigo; var buenos, regulares:byte); forward;

function esAdecuado(codigo: TCodigo; h: THistoria): boolean;
var i:byte;
begin

for i:=low(h.tope) to NumeroHistoriaVacia do begin

 calcularNota(historia.info[i].codigo, codigo, buenos, regulares);
{EL argumento de tipo THistoria se pasara al "adivinador"
 EL argumento codigo pasara como "pensador" y sera el codigo que se modificara para poder postular
 Los argumentos "buenos" y "regulares" pasaran sin sentido}

 end;

result:=esA;

end;

procedure calcularNota(adivinador, pensador: TCodigo; var buenos, regulares:byte);
type Evaluadas= array[1..LARGO_CODIGO] of boolean;
var evaluadasA, evaluadasP: evaluadas;
    l, i, j, k: byte;
begin

for l:=low(historia.tope) to NumeroHistoriaVacia do begin

for i:=1 to LARGO_CODIGO do begin
  if (pensador[i]=adivinador[i]) then begin
   evaluadasP[i]:=true;
   evaluadasA[i]:=true;
   Hvacia.info[L].b+=1;
   end;
  end;

 for j:=1 to LARGO_CODIGO do begin
  if not evaluadasP[j] then begin
   for k:=1 to LARGO_CODIGO do begin
    if not evaluadasA[k] then begin
     if (pensador[j]=adivinador[k]) then begin
     HVacia.info[l].r+=1;
     evaluadasA[k]:= true;
     evaluadasP[j]:=true;
     end;
    end;
   end;
  end;
end;
 if not ((Hvacia.info[l].r = historia.info[l].r) and (HVacia.info[l].b=historia.info[l].b)) then begin //Se comparan casillero por casillero del historial de codigo de una historia temporal con los del permanente y se obtienen los buenos y regulares de dicha comparacion
 esA:=false;
 break;
 end else begin
 esA:=true;
end;

end;
end;

//6. Repetir desde el punto 2.

begin

repeat
intento+=1;

if intento=1 then begin //Revisar  que hacer en caso de que en la primer nota sea B=0 R=0
variablesDef();
writeln('MasterMind V3.0');
writeln('Dispones de ',MAX_INTENTOS,' intentos para adivinar el codigo.');
writeln;
writeln;
generarcodigo(codigo);
end;

repeat
write('Nota ',intento,' de ',MAX_INTENTOS,' -->');
imprimirCodigo(codigo);
write(' >>');
until leerNotas(buenos, regulares, EMensaje);

esHistoriaVacia(historia);

guardarNota(historia, codigo, buenos, regulares);
crearHistoria();
siguienteCodigo(codigo);

until (intento=MAX_INTENTOS);

readln;
end.

