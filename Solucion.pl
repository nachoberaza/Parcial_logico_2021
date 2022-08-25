temaCopado(chocobos).
temaCopado(inversiones).
temaCopado(harryPotter).
temaCopado(carpinchos).
temaCopado(bidones).
temaCopado(piratas).
temaCopado(tierraMedia).
temaCopado(kraken).

punto(primerOrden).
punto(ordenSuperior).
punto(polimorfismo).
punto(listas).
punto(relleno).
punto(modelado).
punto(diagramado).

sabe(Luz,relleno).
% 0.
% parcial(Tema,[Puntos]).


parcial(pdp1,[primerOrden,polimorfismo]).
parcial(ads,[listas,modelado,diagramado]).
parcial(disenio,[modelado,ordenSuperior]).
parcial(tecnicas_programacion,[primerOrden,modelado]).
parcial(carpinchos,[primerOrden,modelado,ordenSuperior,polimorfismo,listas,relleno,diagramado]).

% 1. parcialEvalua/2
%    - Relaciona un parcial con un punto que evalúa. No requiere ser inversible para el parcial.
  
parcialEvalua(parcial(_,ListaPuntos),Punto):-
  punto(Punto),
  member(Punto, ListaPuntos).

% 2. esParcialListo/1
%   - resulta verdadero para un parcial que cumple todas las reglas de los parciales:
%       -- tiene entre 7 y 10 puntos, 
%       -- tiene un tema copado,
%       -- evalúa todos los puntos al menos una vez.
esParcialListo(parcial(Tema,Puntos)):- 
  temaCopado(Tema),
  longitudValida(Puntos),
  evalua(Puntos).

longitudValida(Lista):-
  length(Lista,Longitud),
  between(7, 10, Longitud).

% Evalua todos los puntos al menos una vez?
evalua(ListaPuntos):-
  findall(Punto,punto(Punto),PuntosExistentes),
  subset(PuntosExistentes,ListaPuntos).


% TODO:
% 3. puntosInventados/1:
%  - Genera una lista de puntos de cantidad válida.
puntosInventados(ListaPuntos):- 
  findall(Punto,punto(Punto),ListaPuntos).

% TODO:
% 4. nuevoParcial/1: 
%   - Genera un parcial nuevo que esté listo.


% 5. Ya que nos están haciendo los parciales, vamos a tratar de predecir quienes van a aprobar. 
% Agregar a la base de conocimiento un predicado que relacione el nombre de un estudiante y un punto que sabe, con ejemplos.


% 6.
% 7.
% 8.