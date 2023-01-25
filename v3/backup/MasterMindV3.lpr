program MasterMindV3;
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
  codigo: TCodigo;
  b, r: integer;
end;
THistoria = record //Un arreglo de TRegistroNota para guardar los códigos y sus notas, implementado como arreglo con tope.
  info : array [1..MAX_INTENTOS] of TRegistroNota;
  tope : 0..MAX_INTENTOS;
end;

var codigo, codigo1: TCodigo;
    esA, trampa: boolean;
    historia:THistoria;
    HVacia: TRegistroNota;
    EMensaje: string;
    buenos, regulares, NumeroHistoriaVacia, intento: byte;
    espacio, i: char;
    cantidadLetras:byte;
//Se colocan las variables en valor por defecto
procedure variablesDef();
{acomodar de acuerdo al numero de intento}
begin
trampa:=false;

historia.tope:=MAX_INTENTOS;

NumeroHistoriaVacia:=0;

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

for i:=1 to LARGO_CODIGO do begin
  codigo1[i]:=codigo[i];
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

{Se muestra el error de que se ingresaron notas a bueno o regulares mayor o
menores respecto al largo del codigo}

if ((b {%H-}< 0) or (r {%H-}< 0) ) or ((b > LARGO_CODIGO) or (r > LARGO_CODIGO)) then begin
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

result:=true; //Retorna true si no hubo errores en el ingreso de notas
end;

// 4. Guardar el código con las notas recibidas en la historia.
function esHistoriaVacia(h: THistoria): boolean;

begin
 NumeroHistoriaVacia+=1;
 result:=true;
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
var i: byte;
    c1, c2, c3, c4:char;
    c1_1, c2_1, c3_1, c4_1:byte;

begin

for i:=LARGO_CODIGO downto 1 do begin

  c1:=codigo[LARGO_CODIGO];
  for c1_1:=1 to cantidadLetras do begin
    if (c1<>ULTIMA_LETRA) then begin
    c1:= chr(ord (c1)+1)
    end;
    if (c1=ULTIMA_LETRA) then begin
    c1:=primera_LETRA;
    end;
    codigo[LARGO_CODIGO]:=c1;
     if esAdecuado(codigo, historia) then exit;

     if (i<=(LARGO_CODIGO - 1)) then begin
     c2:=codigo[LARGO_CODIGO-1];
     for c2_1:=1 to cantidadLetras do begin
      if (c2<>ULTIMA_LETRA) then begin
      c2:= chr(ord (c2)+1)
      end;
      if (c2=ULTIMA_LETRA) then begin
      c2:=primera_LETRA;
      end;
      codigo[LARGO_CODIGO - 1]:=c2;
      if esAdecuado(codigo, historia) then exit;

      if (i<=(LARGO_CODIGO - 2)) then begin
      c3:=codigo[(LARGO_CODIGO -2)];
      for c3_1:=1 to cantidadLetras do begin
        if (c3<>ULTIMA_LETRA)then begin
        c3:= chr(ord (c3)+1)
        end;
        if (c3=ULTIMA_LETRA) then begin
        c3:=primera_LETRA;
        end;
        codigo[LARGO_CODIGO - 2]:=c3;
        if esAdecuado(codigo, historia) then exit;

        if (i=LARGO_CODIGO div LARGO_CODIGO) then
        c4:=codigo[LARGO_CODIGO div LARGO_CODIGO];
        for c4_1:=1 to cantidadLetras do begin
          if (c4<>ULTIMA_LETRA) then begin
          c4:= chr(ord (c4)+1)
          end;
          if (c4=ULTIMA_LETRA) then begin
          c4:=primera_LETRA;
          end;
          codigo[LARGO_CODIGO div LARGO_CODIGO]:=c4;
          if esAdecuado(codigo, historia) then exit;
        end;
      end;
    end;
    end;
  end;
    end;
  end;
  end;

{Se realiza una ramificacion de opciones a modo de potencia (TLetras):
1.Se comprueba cambiando uno a uno las letras en TLetras
2.Se cambia la ultima letra, y por cada cambio cambian las otras una vez
3.Por cada cambio de la ultima letra, cambia la segunda T veces y las demascambian T veces cada cambio de la tercera
4.A demas de lo anterior ahora la segunda letra tambien cambia T veces las veces que cambia la tercer letra}


procedure calcularNota(adivinador, pensador: TCodigo; var buenos, regulares:byte); forward;

function esAdecuado(codigo: TCodigo; h: THistoria): boolean;
type Evaluadas= array[1..LARGO_CODIGO] of boolean;
var evaluadasA, evaluadasP: evaluadas;
    i, j:byte;
    codigo1: TCodigo;
begin

for i:=1 to NumeroHistoriaVacia do begin

 calcularNota(historia.info[i].codigo, codigo, buenos, regulares);

 {EL argumento de tipo THistoria se pasara al "adivinador"
 EL argumento codigo pasara como "pensador" y sera el codigo que se modificara para poder postular
 Los argumentos "buenos" y "regulares" pasaran sin sentido}
   if ((Hvacia.r <> historia.info[i].r) or (HVacia.b <> historia.info[i].b)) then begin //Se comparan casillero por casillero del historial de codigo de una historia temporal con los del permanente y se obtienen los buenos y regulares de dicha comparacion
   esA:=false;
   break;
   end;

   esA:=true;

   {Se dejan las evaluadas en false}
   for j:=1 to LARGO_CODIGO do begin
   evaluadasA[j]:=false;
   evaluadasP[j]:=false;
   end;


  {Se deja HVacia en default}
  HVacia.b:=0;
  Hvacia.r:=0;
 end;

for j:=1 to LARGO_CODIGO do begin
   evaluadasA[j]:=false;
   evaluadasP[j]:=false;
   end;

HVacia.b:=0;
Hvacia.r:=0;

result:=esA;

end;

procedure calcularNota(adivinador, pensador: TCodigo; var buenos, regulares:byte);
type Evaluadas= array[1..LARGO_CODIGO] of boolean;
var evaluadasA, evaluadasP: evaluadas;
    i, j, k: byte;
begin
//POSIBLE ERROR EN ASIGNACION DE NOTAS (ya que el codigo cambia)
for i:=1 to LARGO_CODIGO do begin
  if (pensador[i]=adivinador[i]) then begin   //Error entra en el if mas veces de las necesaria
   evaluadasP[i]:=true;
   evaluadasA[i]:=true;
   Hvacia.b+=1;
   end;
  end;

 for j:=1 to LARGO_CODIGO do begin
  if not evaluadasP[j] then begin
   for k:=1 to LARGO_CODIGO do begin
    if not evaluadasA[k] then begin
     if (pensador[j]=adivinador[k]) then begin
     HVacia.r+=1;
     evaluadasA[k]:= true;
     evaluadasP[j]:=true;
     end;
    end;
   end;
  end;
end;

end;

//6. Repetir desde el punto 2.

begin
intento:=0;

cantidadLetras:=0;

for i in TLetras do begin
cantidadLetras+=1;
end;

repeat //Inicia el juego

intento+=1;


{Se muestra el mensaje inicial sobre el juego y se establecen algunas variables
en su valor por defecto}
if intento=1 then begin

variablesDef();

writeln('MasterMind V3.0');
writeln('Dispones de ',MAX_INTENTOS,' intentos para adivinar el codigo.');
writeln;
writeln;

generarcodigo(codigo);

end;

repeat

{Se chequea que el codigo no vuelva a ser el mismo que en el intento 1}
if (intento>1) and (codigo=codigo1) then begin
  trampa:=true;
  write('HAS HECHO TRAMPA!!!');
  exit;
  end;

write('Nota ',intento,' de ',MAX_INTENTOS,' -->');
imprimirCodigo(codigo);
write(' >>');

until leerNotas(buenos, regulares, EMensaje);

esHistoriaVacia(historia);

guardarNota(historia, codigo, buenos, regulares);
crearHistoria();
siguienteCodigo(codigo);

{Se controla si se gano}
if (buenos=4)  then begin
writeln;
write('EXCELENTE!!! Gane');
break;
end;

until (intento=MAX_INTENTOS); //Termina el juego

{Se controla si se perdio o no}
if (intento=MAX_INTENTOS) and (buenos<>4) then begin
write('He perdido... :(');
end;

readln;
end.

