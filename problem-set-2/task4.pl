got(josh, car).
got(steve, lamp).
got(julia, doll).
got(tom, wig).

gives(1, josh, car, steve).
gives(2, steve, car, tom).
gives(3, tom, car, julia).
gives(10, julia, car, steve).
gives(15, steve, car, josh).

got(0, WHO, WHAT) :- got(WHO, WHAT).
