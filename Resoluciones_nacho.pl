:- discontiguous entre7y10Puntos/1.

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

% parcial( Tema, [Puntos] ).
parcial(inversiones,[polimorfismo,polimorfismo,listas,relleno,modelado,diagramado,primerOrden,ordenSuperior]).

% sabe(Alumno,Punto)
sabe(nacho,polimorfismo).
sabe(nacho,relleno).
sabe(nacho,primerOrden).
sabe(nacho,ordenSuperior).
sabe(nacho,modelado).
sabe(nacho,listas).
sabe(nacho,diagramado).


sabe(nicolas,diagramado).
sabe(francisco,relleno).
sabe(francisco,listas).


/* --------------------------------------------------------------------------------------------------------------------------------- */

% 1. Parcial Evalua ----------------------------------------------------------------------------------------
parcialEvalua( parcial(_,Puntos) , PuntoQueEvalua):-
    punto(PuntoQueEvalua),
    member(PuntoQueEvalua,Puntos).

% 2. Parcial Listo ----------------------------------------------------------------------------------------
todosLosPuntos(TodosLosPuntosExistentes):-
    findall(P,punto(P),TodosLosPuntosExistentes).

entre7y10Puntos(Puntos):-
    length(Puntos, Largo),
    between(7, 10, Largo).
    
evaluaTodo(PuntosEvaluados):-
    todosLosPuntos(PuntosAEvaluar),
    subset(PuntosAEvaluar,PuntosEvaluados).

esParcialListo( parcial(Tema,Puntos) ):-
    entre7y10Puntos(Puntos),
    evaluaTodo(Puntos),
    temaCopado(Tema).


% 3. Puntos Inventados ----------------------------------------------------------------------------------------
tomadoAlAzar(PuntoAleatorio):-
    todosLosPuntos(PE),
    length(PE, TotalDePuntos), 
    LimiteSuperior is (TotalDePuntos-1),
    random(0, LimiteSuperior ,Pos),
    nth0(Pos, PE, PuntoAleatorio).


agrega(_,Resultado):-
    length(Resultado, Long),
    between(7,10,Long).
    
agrega(Lista,Resultado):-
    tomadoAlAzar(Punto),
    append([Punto],Lista,Resultado),
    agrega(Resultado,NuevaLista).


puntosInventados(ListaDePuntos):- 
    agrega([],ListaDePuntos).

puntosInventados(ListaDePuntos):-
    todosLosPuntos(Puntos),
    subset(Puntos,ListaDePuntos),
    entre7y10Puntos(ListaDePuntos).
    


% 4. Nuevo Parcial ----------------------------------------------------------------------------------------
nuevoParcial(parcial(Tema,Puntos)):-
    puntosInventados(Puntos),
    esParcialListo(parcial(Tema,Puntos)).

% 6. Aprueba ----------------------------------------------------------------------------------------
todosLosPuntosQueSabe(Estudiante,PuntosQueSabe):-
    sabe(Estudiante,_),
    sabe(OtroE,_),
    Estudiante \= OtroE,
    findall(PA,sabe(Estudiante,PA),PuntosQueSabe).
    
aprueba(Estudiante,parcial(_,PuntosATomar)):-
    todosLosPuntosQueSabe(Estudiante,PuntosQueSabe),
    subset(PuntosATomar,PuntosQueSabe).

% 7. Los que aprueban ----------------------------------------------------------------------------------------

% findall(Estudiante,aprueba(Estudiante,parcial(chocobos,[primerOrden,primerOrden,ordenSuperior,polimorfismo,listas,relleno,modelado,diagramado])),Aprobados).


% 8. Solo para elegidos (Utilizando la estructura de la consulta del punto 7) ----------------------------------------------------------------------------------------
todosSonElMismo(Lista):-
    forall(
        (
            member(Elem1, Lista),
            member(Elem2,Lista)
        ),
        Elem1 == Elem2   
    ).

soloParaElegidos(Parcial):-
    findall( Estudiante, aprueba( Estudiante,Parcial),Aprobados),
    todosSonElMismo(Aprobados).
    