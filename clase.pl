pertenece(X,[X|_]) .
pertenece(X,[_|R]):- pertenece(X,R). 

imprimir([]).
imprimir( [A | B] ):- write(A),nl,
imprimir(B). 	

generos(Generos) :- Generos = ([
	'accion',
	'animada',
	'aventura',
	'belica',
	'biografia',
	'cienciaFiccion',
	'comedia',
	'crimen',
	'drama',
	'fantasia',
	'musical',
	'policial',
	'romance',
	'suspenso',
	'terror',
	'thriller',
	'todos'
]).

actores(Actores) :- Actores = (['Adrien Brody',
'Al Pacino',
'Albert Brooks',
'Andrew Garfield',
'Anthony Hopkins',
'Art Parkinson',
'Ben Burtt',
'Ben Stiller',
'Benicio Del Toro',
'Brad Pitt',
'Brendan Fraser',
'Bruce Willis',
'Carrie Anne Moss',
'Christian Bale',
'Clint Eastwood',
'Colin Farrell',
'Dakota Fanning',
'Daniel Craig',
'Daniel Radcliffe',
'Danny Elfman',
'Dev Patel',
'Donnie Yen',
'Ed Esner',
'Edward Norton',
'Elson Coltrane',
'Emma Stone',
'Ewan McGregor',
'Felicity Jones',
'Frances McDormand',
'Francois Cluzet',
'Hugh Jackman',
'Humberto Velez',
'J K Simmons',
'James McAvoy',
'Jennifer Connely',
'Jennifer Lawrence',
'Joaquin Phoenix',
'John Goodman',
'John Leguizamo',
'John Travolta',
'Johnny Depp',
'Josh Brolin',
'Keanu Reeves',
'Kelly Macdonald',
'Lane Scott',
'Leonardo Dicaprio',
'Liam Neeson',
'Lucila Gomez',
'Mandy Moore',
'Matthew Broderick',
'Mel Gibson',
'Michael Keaton',
'Mike Myers',
'Morgan Freeman',
'Natalie Portman',
'Nicolas Cage',
'Nicole Kidman',
'Oscar Isaac',
'Owen Wilson',
'Paton Oswalt',
'Quentin Tarantino',
'Quentin Tarantino',
'Ricardo Darin',
'Robby Benson',
'Robert De Niro',
'Robert Downey Jr',
'Roberto Benigni',
'Robin Williams',
'Russel Crowe',
'Ryan Gosling',
'Sally Hawkins',
'Sam Neil',
'Sam Worthington',
'Samuel L Jackson',
'Steve Bucemi',
'Steve Carell',
'Suraj Sharma',
'Tobey Maguire',
'Tom Cruise',
'Tom Hanks',
'Tom Hardy',
'Tom Hiddlestone',
'Uma Thurman',
'Viggo Mortensen',
'Wagner Moura',
'Will Smith','todos']).

menu :- write(''),nl,write('***Recomendador de Peliculas***'), nl,
		write('ingrese el numero de opcion'),nl,
		write('1. Iniciar'),nl,
		write('2. salir'),nl,
		read(OpcionMenu),
		inicio(OpcionMenu).
		
inicio(OpcionMenu) :- OpcionMenu == 1, iniciarPrograma, menu;
					  OpcionMenu > 2 , menu;
					  OpcionMenu < 1, menu;
					  OpcionMenu == 2, true.

iniciarPrograma :-

		write(''),nl,write('ingrese un rango de anios para elegir una pelicula'),nl,nl,
		write('ingrese anio de inicio'),nl,nl,
		read(AnioInicial),
		write('ingrese anio de fin'),nl,
		read(AnioFinal),
		validarAnio(AnioInicial,AnioFinal).
		
validarAnio(AnioInicial,AnioFinal) :-
		((AnioInicial < 1990 ; AnioFinal > 2018; AnioInicial > AnioFinal ) -> errorIngresoAnio);
		((AnioInicial > 1989 , AnioFinal < 2019 , AnioInicial < AnioFinal) -> elegirAnio(AnioInicial,AnioFinal)).

errorIngresoAnio :- 
		write('el rango de anios ingresado es incorrecto'),nl,
		iniciarPrograma.
		
elegirAnio(AnioInicial,AnioFinal) :-
		write(''),nl,write('rango de anios:'),
		write(AnioInicial),
		write('-'),
		write(AnioFinal),nl,nl, ingresoGenero.
		
ingresoGenero :-
		write('ingrese el genero que quiere sea su pelicula'),nl,
		generos(Generos),imprimir(Generos),
		read(Genero),
		validarGenero(Genero).

validarGenero(Genero) :-
		((generos(Generos),pertenece(Genero,Generos)) -> elegirGenero(Genero));
		((generos(Generos),\+pertenece(Genero,Generos)) -> errorGenero).
	
errorGenero :-
		write('el genero ingresado es incorrecto'),nl,ingresoGenero.

elegirGenero(Genero) :-
		write(''),nl,write('el genero que eligio es '),
		write(Genero),nl, ingresoActor.
		
ingresoActor :-
		write(''),nl,write('ingrese al actor que quiere en su pelicula'),nl,
		actores(Actores),imprimir(Actores).
	
		