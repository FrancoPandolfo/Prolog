split(String,L) :-
	split_string(String,' ','',L).
	
evaluar(String) :-
	split(String,L), oracion(L,[]),write('\n'),write('la oracion ingresada es valida'),nl,nl.
evaluar(String) :-
	split(String,L), \+oracion(L,[]),write('\n'),write('la oracion ingresada es invalida'),nl,nl.
	
oracion(X, Y) :- sujeto(X, U), predicado(U, V).

%determinante(articulo,demostrativo,posesivo,numeral,indefinido,interrogativo,exclamativo) + nucleo(sustantivo,pronombre)
sujeto(X,Y) :- pronombre(X,Y).
sujeto(X,Y) :- nombre(X,Y).
sujeto(X, Y) :- articulo(X, U), sustantivo(U, Y).
sujeto(X, Y) :- articulo(X, U),adjetivo(U,J), sustantivo(J, Y).
sujeto(X,Y) :- preposicion(X,U),nombre(U,J),pronombre(J,Y).
sujeto(X,Y) :- preposicion(X,U),articulo(U,J),sustantivo(J,K),pronombre(K,Y).

%verbo auxiliar + verbo principal(infinitivo,gerundio,participio)
predicado(X, Y) :- verboAuxiliar(X, Y).
predicado(X, Y) :- verboAuxiliar(X,U),adjetivo(U,Y).
predicado(X, Y) :- adjetivo(X,U),verboAuxiliar(U,Y).
predicado(X, Y) :- verboAuxiliar(X, U), verboPrincipal(U,Y).
predicado(X, Y) :- verboAuxiliar(X, U), sujeto(U, Y).
predicado(X, Y) :- verboAuxiliar(X, U),articulo(U,J),adjetivo(J,K), sujeto(K,Y).


iniciar :-
	write('validador de oraciones'),nl,
	write('ingrese "salir" para salir del programa'),nl,
	write('ingrese una oracion ente comillas dobles, ej: "a Juan le gusta comer" '),nl,
	read(String),
	(String \= "salir", evaluar(String),iniciar);
	(String = "salir", true).


preposicion(["a" | Y], Y).

articulo(["el" | Y], Y).
articulo(["la" | Y], Y).
articulo(["los" | Y], Y).
articulo(["las" | Y], Y).
articulo(["un" | Y], Y).
articulo(["unos" | Y], Y).
articulo(["una" | Y], Y).
articulo(["unas" | Y], Y).

pronombre(["el" | Y], Y).
pronombre(["ella" | Y], Y).
pronombre(["ellos" | Y], Y).
pronombre(["ellas" | Y], Y).
pronombre(["nosotros" | Y], Y).
pronombre(["vos" | Y], Y).
pronombre(["yo" | Y], Y).
pronombre(["le" | Y], Y).
pronombre(["les" | Y], Y).
pronombre(["los" | Y], Y).
pronombre(["las" | Y], Y).

nombre(["Leandro" | Y], Y).
nombre(["Ariel" | Y], Y).
nombre(["Victor" | Y], Y).
nombre(["Demian" | Y], Y).
nombre(["Martin" | Y], Y).
nombre(["Gaston" | Y], Y).
nombre(["Damian" | Y], Y).
nombre(["Santiago" | Y], Y).
nombre(["Braian" | Y], Y).
nombre(["Hernan" | Y], Y).
nombre(["Juan Pablo" | Y], Y).
nombre(["Ignacio" | Y], Y).
nombre(["Guido" | Y], Y).
nombre(["Francisco" | Y], Y).
nombre(["Facundo" | Y], Y).
nombre(["Nicolas" | Y], Y).
nombre(["Franco" | Y], Y).
nombre(["Agustin" | Y], Y).
nombre(["Romina" | Y], Y).
nombre(["Hector" | Y], Y).
nombre(["Pablo" | Y], Y).
nombre(["Fernando" | Y], Y).
nombre(["Johana" | Y], Y).
nombre(["Diego" | Y], Y).
nombre(["Adrian" | Y], Y).
nombre(["Ruben" | Y], Y).
nombre(["Jose Maria" | Y], Y).
nombre(["Jose" | Y], Y).
nombre(["Maria" | Y], Y).
nombre(["Juan" | Y], Y).
nombre(["Mauro" | Y], Y).
nombre(["Fabricio" | Y], Y).
nombre(["Diego" | Y], Y).
nombre(["Luan" | Y], Y).
nombre(["Sofia" | Y], Y).
nombre(["Matias" | Y], Y).

sustantivo(["perro" | Y], Y).
sustantivo(["perra" | Y], Y).
sustantivo(["caballo" | Y], Y).
sustantivo(["perras" | Y], Y).
sustantivo(["perros" | Y], Y).
sustantivo(["gato" | Y], Y).
sustantivo(["gatos" | Y], Y).
sustantivo(["gata" | Y], Y).
sustantivo(["gatas" | Y], Y).
sustantivo(["casa" | Y], Y).
sustantivo(["casas" | Y], Y).
sustantivo(["profesor" | Y], Y).
sustantivo(["profesores" | Y], Y).
sustantivo(["alumno" | Y], Y).
sustantivo(["alumnos" | Y], Y).
sustantivo(["libro" | Y], Y).
sustantivo(["libros" | Y], Y).
sustantivo(["animal" | Y], Y).
sustantivo(["animales" | Y], Y).
sustantivo(["arbol" | Y], Y).
sustantivo(["arboles" | Y], Y).
sustantivo(["calculadora" | Y], Y).
sustantivo(["calculadoras" | Y], Y).
sustantivo(["cuaderno" | Y], Y).
sustantivo(["cuadernos" | Y], Y).
sustantivo(["notebook" | Y], Y).
sustantivo(["notebooks" | Y], Y).
sustantivo(["laptop" | Y], Y).
sustantivo(["laptops" | Y], Y).
sustantivo(["proyector" | Y], Y).
sustantivo(["Argentina" | Y], Y).
sustantivo(["Buenos Aires" | Y], Y).
sustantivo(["silla" | Y], Y).
sustantivo(["sillas" | Y], Y).
sustantivo(["mesa" | Y], Y).
sustantivo(["ventana" | Y], Y).
sustantivo(["facultad" | Y], Y).
sustantivo(["puerta" | Y], Y).
sustantivo(["ropa" | Y], Y).
sustantivo(["remera" | Y], Y).
sustantivo(["pantalon" | Y], Y).
sustantivo(["buzo" | Y], Y).
sustantivo(["clase" | Y], Y).
sustantivo(["luz" | Y], Y).
sustantivo(["lapiz" | Y], Y).
sustantivo(["lapicera" | Y], Y).
sustantivo(["botella" | Y], Y).
sustantivo(["anteojos" | Y], Y).
sustantivo(["cama" | Y], Y).
sustantivo(["barco" | Y], Y).
sustantivo(["auto" | Y], Y).
sustantivo(["autos" | Y], Y).
sustantivo(["moto" | Y], Y).
sustantivo(["motos" | Y], Y).
sustantivo(["casco" | Y], Y).
sustantivo(["comedor" | Y], Y).
sustantivo(["kiosco" | Y], Y).
sustantivo(["boliche" | Y], Y).
sustantivo(["celular" | Y], Y).
sustantivo(["celulares" | Y], Y).
sustantivo(["chico" | Y], Y).
sustantivo(["chicos" | Y], Y).
sustantivo(["hombre" | Y], Y).
sustantivo(["hombres" | Y], Y).
sustantivo(["chica" | Y], Y).
sustantivo(["chicas" | Y], Y).
sustantivo(["mujer" | Y], Y).
sustantivo(["mujeres" | Y], Y).
sustantivo(["tarde" | Y], Y).
sustantivo(["hoy" | Y], Y).
sustantivo(["dia" | Y], Y).
sustantivo(["paloma" | Y], Y).
sustantivo(["presentacion" | Y], Y).

verboAuxiliar(["voy" | Y], Y).
verboAuxiliar(["va" | Y], Y).
verboAuxiliar(["van" | Y], Y).
verboAuxiliar(["vienen" | Y], Y).
verboAuxiliar(["vas" | Y], Y).
verboAuxiliar(["iba" | Y], Y).
verboAuxiliar(["iban" | Y], Y).
verboAuxiliar(["ibamos" | Y], Y).
verboAuxiliar(["ibas" | Y], Y).
verboAuxiliar(["esta" | Y], Y).
verboAuxiliar(["estas" | Y], Y).
verboAuxiliar(["estoy" | Y], Y).
verboAuxiliar(["estan" | Y], Y).
verboAuxiliar(["estamos" | Y], Y).
verboAuxiliar(["estaba" | Y], Y).
verboAuxiliar(["estabamos" | Y], Y).
verboAuxiliar(["estabas" | Y], Y).
verboAuxiliar(["estaban" | Y], Y).
verboAuxiliar(["sigue" | Y], Y).
verboAuxiliar(["siguen" | Y], Y).
verboAuxiliar(["seguis" | Y], Y).
verboAuxiliar(["sigo" | Y], Y).
verboAuxiliar(["segui" | Y], Y).
verboAuxiliar(["seguiste" | Y], Y).
verboAuxiliar(["siguieron" | Y], Y).
verboAuxiliar(["seguimos" | Y], Y).
verboAuxiliar(["lleva" | Y], Y).
verboAuxiliar(["llevas" | Y], Y).
verboAuxiliar(["llevan" | Y], Y).
verboAuxiliar(["llevamos" | Y], Y).
verboAuxiliar(["llevaron" | Y], Y).
verboAuxiliar(["llevaba" | Y], Y).
verboAuxiliar(["llevaban" | Y], Y).
verboAuxiliar(["llevabamos" | Y], Y).
verboAuxiliar(["llevabas" | Y], Y).
verboAuxiliar(["deja" | Y], Y).
verboAuxiliar(["dejo" | Y], Y).
verboAuxiliar(["dejamos" | Y], Y).
verboAuxiliar(["dejaron" | Y], Y).
verboAuxiliar(["dejas" | Y], Y).
verboAuxiliar(["dejabas" | Y], Y).
verboAuxiliar(["dejeba" | Y], Y).
verboAuxiliar(["dejaban" | Y], Y).
verboAuxiliar(["dejabamos" | Y], Y).
verboAuxiliar(["empieza" | Y], Y).
verboAuxiliar(["empezamos" | Y], Y).
verboAuxiliar(["empiezan" | Y], Y).
verboAuxiliar(["empezo" | Y], Y).
verboAuxiliar(["cotinuo" | Y], Y).
verboAuxiliar(["continuamos" | Y], Y).
verboAuxiliar(["continuan" | Y], Y).
verboAuxiliar(["continuas" | Y], Y).
verboAuxiliar(["soy" | Y], Y).
verboAuxiliar(["es" | Y], Y).
verboAuxiliar(["son" | Y], Y).
verboAuxiliar(["sos" | Y], Y).
verboAuxiliar(["somos" | Y], Y).
verboAuxiliar(["fueron" | Y], Y).
verboAuxiliar(["fue" | Y], Y).
verboAuxiliar(["fuimos" | Y], Y).
verboAuxiliar(["fui" | Y], Y).
verboAuxiliar(["tengo" | Y], Y).
verboAuxiliar(["tenemos" | Y], Y).
verboAuxiliar(["galopa" | Y], Y).
verboAuxiliar(["tenes" | Y], Y).
verboAuxiliar(["tenia" | Y], Y).
verboAuxiliar(["tenian" | Y], Y).
verboAuxiliar(["teniamos" | Y], Y).
verboAuxiliar(["tenias" | Y], Y).
verboAuxiliar(["tuve" | Y], Y).
verboAuxiliar(["tuvieron" | Y], Y).
verboAuxiliar(["tuviste" | Y], Y).
verboAuxiliar(["tuvimos" | Y], Y).
verboAuxiliar(["gusta" | Y], Y).
verboAuxiliar(["encanta" | Y], Y).
verboAuxiliar(["camino" | Y], Y).
verboAuxiliar(["camina" | Y], Y).
verboAuxiliar(["caminan" | Y], Y).
verboAuxiliar(["caminamos" | Y], Y).


verboPrincipal(["estudiar" | Y], Y).
verboPrincipal(["comer" | Y], Y).
verboPrincipal(["dormir" | Y], Y).
verboPrincipal(["empezar" | Y], Y).
verboPrincipal(["llorar" | Y], Y).
verboPrincipal(["hacer" | Y], Y).
verboPrincipal(["trabajando" | Y], Y).
verboPrincipal(["estudiando" | Y], Y).
verboPrincipal(["buscando" | Y], Y).
verboPrincipal(["mirando" | Y], Y).
verboPrincipal(["presentando" | Y], Y).
verboPrincipal(["comiendo" | Y], Y).
verboPrincipal(["caminando" | Y], Y).
verboPrincipal(["empezando" | Y], Y).
verboPrincipal(["llorando" | Y], Y).
verboPrincipal(["haciendo" | Y], Y).
verboPrincipal(["terminando" | Y], Y).
verboPrincipal(["terminar" | Y], Y).

adjetivo(["blanco" | Y], Y).
adjetivo(["buen" | Y], Y).
adjetivo(["bueno" | Y], Y).
adjetivo(["buena" | Y], Y).
adjetivo(["lindo" | Y], Y).
adjetivo(["linda" | Y], Y).
adjetivo(["feliz" | Y], Y).
adjetivo(["triste" | Y], Y).
adjetivo(["enojado" | Y], Y).
adjetivo(["malo" | Y], Y).
adjetivo(["enojada" | Y], Y).
adjetivo(["mala" | Y], Y).
adjetivo(["feo" | Y], Y).
adjetivo(["fea" | Y], Y).
adjetivo(["amargo" | Y], Y).
adjetivo(["dulce" | Y], Y).
adjetivo(["negro" | Y], Y).
adjetivo(["blanco" | Y], Y).
adjetivo(["azul" | Y], Y).
adjetivo(["rojo" | Y], Y).
adjetivo(["verde" | Y], Y).
adjetivo(["amarillo" | Y], Y).
adjetivo(["limpio" | Y], Y).
adjetivo(["ordenado" | Y], Y).
adjetivo(["sucio" | Y], Y).	
adjetivo(["sucia" | Y], Y).	
adjetivo(["caluroso" | Y], Y).	
adjetivo(["fresco" | Y], Y).	
adjetivo(["mojado" | Y], Y).	
adjetivo(["seco" | Y], Y).		
adjetivo(["soleado" | Y], Y).	
adjetivo(["gordo" | Y], Y).	
adjetivo(["flaco" | Y], Y).	
adjetivo(["grande" | Y], Y).
adjetivo(["chico" | Y], Y).	
adjetivo(["verdadero" | Y], Y).	
adjetivo(["falso" | Y], Y).	
adjetivo(["alto" | Y], Y).	
adjetivo(["bajo" | Y], Y).		
adjetivo(["fino" | Y], Y).	
adjetivo(["ancho" | Y], Y).	
adjetivo(["aburrido" | Y], Y).	
adjetivo(["interesante" | Y], Y).	
adjetivo(["entretenido" | Y], Y).	
adjetivo(["entretenida" | Y], Y).	
adjetivo(["lento" | Y], Y).	
adjetivo(["lenta" | Y], Y).	
adjetivo(["rapido" | Y], Y).	
adjetivo(["rapida" | Y], Y).	
adjetivo(["contento" | Y], Y).	
adjetivo(["contenta" | Y], Y).	