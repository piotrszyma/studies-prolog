use_module(library(xpath)).
use_module(library(url)).

serwery(Adres, ListaSerwerow) :-
  op(400, fx, //),
  op(200, fy, @),
  load_html(Adres, Term, []),
  setof(A, find_and_extract(Term, A), ListaSerwerow).

find_and_extract(DOM, Element) :-
  xpath(DOM, //a(@href), A),
  sub_atom(A, 0, 4, _, 'http'),
  parse_url(A, [_, host(Element), _]).
