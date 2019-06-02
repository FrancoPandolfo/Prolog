hija(A,B) :- mujer(A), padre(B,A).
hija(A,B) :- mujer(A), madre(B,A).

hijo(A,B) :- hombre(A), padre(B,A).
hijo(A,B) :- hombre(A), madre(B,A).

abuelo(A,B) :- padre(A,U), padre(U,B).
abuelo(A,B) :- madre(A,U), madre(U,B).

abuela(A,B) :- padre(A,U), padre(U,B).
abuela(A,B) :- madre(A,U), madre(U,B).

hombre(jorge).
hombre(pedro).
hombre(tomas).
mujer(sofia).
mujer(luna).
mujer(camila).

padre(jorge,camila).
madre(luna,camila).
padre(pedro,jorge).
madre(sofia,pedro).
padre(tomas,pedro).

