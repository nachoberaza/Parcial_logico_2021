% 3. Puntos Inventados 
----------------------------------------------------------------------------------------
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
    


% 4. Nuevo Parcial 
----------------------------------------------------------------------------------------
nuevoParcial(parcial(Tema,Puntos)):-
    puntosInventados(Puntos),
    esParcialListo(parcial(Tema,Puntos)).
