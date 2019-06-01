
iniciar :-  nl,nl,write('                    PREOBLEMA DE LAS N REINAS     '), nl, nl,
            write('  Reglas:'),nl,nl,
            write('  Para obtener la solucion al problema debera ingresar un numero N'),nl,
            write('  que es el numero de reinas que desea que participen en el problema.'),nl,nl,
            write('  Recuerde que no puede resolverse el problema para 2 o 3 reinas.'),nl,
            write('  Se devolvera un conjunto de numeros los cuales cada uno representa la'),nl,
            write('  posicion de la reina en una determinada fila, dependiendo la ubicacion'),nl,
            write('  de el numero en el conjunto.'),nl,nl,
			write('ingrese el numero de reinas o 1 para salir'),nl,
			read(N),
			calcular(N).


calcular(N) :-
		((N>3, forall(resolver(N,Solucion),(write(Solucion),nl))),iniciar);
		(N=1,true).
		
resolver(Respuesta, Solucion):-
                    nl, nl,
                    write('Usted eligio el problema de las '),
                    write(Respuesta),
                    write(' reinas.'),nl,nl,
                    validar(Respuesta),
                    write('Posibles soluciones: '),nl,
                    generarTablero(Respuesta, Tablero),
                    permutar(Tablero, Solucion),
                    tableroCorrecto(Solucion).

validar(Respuesta) :-   Respuesta>1; Respuesta < 4,
                        write('No existe solucion para el problema de las '),
                        write(Respuesta),
                        write(' reinas.'), nl, false.


generarTablero(0,[]).
generarTablero(X,[X|R]) :- Menor is X - 1, Menor >= 0, generarTablero(Menor,R).

permutar([],[]).
permutar(X,[C|Z]) :- seleccionar(X,C,R), permutar(R,Z).

seleccionar([X|R],X,R).
seleccionar([C|R],X,[C|Y]) :- seleccionar(R,X,Y).

tableroCorrecto([]).
tableroCorrecto([C|R]) :- not(amenaza(C,R)), tableroCorrecto(R).

amenaza(X,Prof,[C|_]) :-    X is C+Prof;
                            X is C-Prof;
                            X = C.
amenaza(X,Prof,[_|R]) :- ProfMas1 is Prof + 1, amenaza(X,ProfMas1,R).
amenaza(_,[]) :- fail.
amenaza(X,Y) :- amenaza(X,1,Y).
