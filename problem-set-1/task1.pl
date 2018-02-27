ojciec(zeus,ares).
ojciec(zeus,dionysus).
ojciec(cadmus,semelel).
ojciec(ares,harmonia).
ojciec(ares,ada).
ojciec(brat_aresa,stefan).

matka(hera,ares).
matka(hera,brat_aresa).
matka(aphrodite,harmonia).
matka(harmonia,semele).
matka(semele,dionysus).

mezczyzna(X) :- ojciec(X, _).

kobieta(harmonia).
kobieta(ada).
kobieta(X) :- matka(X, _).

rodzic(X, Y) :- 
  matka(X, Y); 
  ojciec(X, Y).

diff(X, Y) :- X \= Y.

jest_matka(X) :- matka(X, _).
jest_ojcem(X) :- ojciec(X, _).
jest_synem(X) :- ojciec(_, X).

siostra(X, Y) :- 
  rodzic(Z, X), 
  rodzic(Z, Y), 
  kobieta(X), 
  kobieta(Y), 
  X \= Y.

brat(X, Y) :- 
  rodzic(Z, X), 
  rodzic(Z, Y), 
  mezczyzna(X), 
  mezczyzna(Y), 
  X \= Y.

dziadek(X, Y) :- 
  rodzic(Z, Y), 
  ojciec(X, Z).

rodzenstwo(X, Y) :- 
  rodzic(Z, X), 
  rodzic(Z, Y),
  X \= Y.
