male(abid).
male(prince).
male(sopon).

female(riya).
female(suma).

parent(abid, prince).
parent(abid, riya).
parent(riya, sopon).
parent(riya, suma).

father(X, Y):-
    male(X),
    parent(X, Y).

mother(X, Y):-
    female(Y),
    parent(X, Y).
