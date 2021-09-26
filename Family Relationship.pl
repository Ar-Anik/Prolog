male(omor).
male(taher).
male(bashar).
male(sadi).
male(dipu).
male(anik).
male(sourov).
male(mahin).
male(sipu).
male(tuhin).
male(tanzir).
male(susmoy).
male(rimon).
male(somrat).
male(ryhan).
male(raju).
male(shuvo).
male(rana).
male(saju).
male(sajib).

female(chafia).
female(fatema).
female(shilpi).
female(riya).
female(mina).
female(urmi).
female(ritu).
female(rim).
female(jafrin).
female(anika).
female(mim).
female(tina).
female(samia).
female(onu).

couple(omor, chafia).
couple(taher, fatema).
couple(bashar, shilpi).
couple(sadi, riya).
couple(sourov, mina).
couple(mahin, urmi).
couple(sipu, ritu).
couple(tanzir, jafrin).
couple(susmoy, anika).
couple(rimon, mim).
couple(somrat, tina).
couple(raju, samia).
couple(shuvo, onu).

parent(omor, taher).
parent(omor, bashar).
parent(taher, sadi).
parent(taher, dipu).
parent(bashar, anik).
parent(bashar, sourov).
parent(sadi, mahin).
parent(sourov, sipu).
parent(mahin, tuhin).
parent(mahin, tanzir).
parent(sipu, rim).
parent(sipu, susmoy).
parent(tanzir, rimon).
parent(susmoy, somrat).
parent(rimon, ryhan).
parent(rimon, raju).
parent(somrat, shuvo).
parent(raju, rana).
parent(shuvo, saju).
parent(shuvo, sojib).

parent(chafia, taher).
parent(chafia, bashar).
parent(fatema, sadi).
parent(fatema, dipu).
parent(shilpi, anik).
parent(shilpi, sourov).
parent(riya, mahin).
parent(mina, sipu).
parent(urmi, tuhin).
parent(urmi, tanzir).
parent(ritu, rim).
parent(ritu, susmoy).
parent(jafrin, rimon).
parent(anika, somrat).
parent(mim, ryhan).
parent(mim, raju).
parent(tina, shuvo).
parent(samia, rana).
parent(onu, saju).
parent(onu, sojib).

hasband(X, Y):-
    male(X),
    couple(X, Y);
    couple(Y, X).

wife(X, Y):-
    female(X),
    couple(X, Y);
    couple(Y, X).

father(X, Y):-
    male(X),
    parent(X, Y).

mother(X, Y):-
    female(X),
    parent(X, Y).

sibling(X, Y):-
    parent(Z, X),
    parent(Z, Y),
    X\=Y.

brother(X, Y):-
    male(X),
    sibling(X, Y).

sister(X, Y):-
    female(X),
    sibling(X, Y).

uncle(X, Y):-
    parent(Z, Y),
    brother(X, Z).

grandfather(X, Z):-
    male(X),
    parent(X, Y),
    parent(Y, Z).

grandmother(X, Z):-
    female(X),
    parent(X, Y),
    parent(Y, Z).

grandparent(X, Y):-
    grandfather(X, Y);
    grandmother(X, Y).

greatgrandparent(X, Y):-
    grandparent(Z, Y),
    parent(X, Z).


first_cousin(X, Y):-
    parent(A, X),
    parent(B, Y),
    sibling(A, B),
    X\=Y.

second_cousin(X, Y):-
    grandparent(A, X),
    grandparent(B, Y),
    sibling(A, B),
    A\=B.

third_cousin(X, Y):-
    greatgrandparent(A, X),
    greatgrandparent(B, Y),
    sibling(A, B),
    A\=B.

first_cousin_once_removed(A, B):-
    parent(X, B),
    first_cousin(A, X),
    A\=B.

first_cousin_twice_removed(A, B):-
    grandfather(X, B),
    first_cousin(A, X),
    A\=B.

second_cousin_once_removed(A, B):-
    parent(X, B),
    second_cousin(A, X),
    A\=B.

second_cousin_twice_removed(A, B):-
    grandfather(X, B),
    second_cousin(A, X),
    A\=B.

third_cousin_once_removed(A, B):-
    parent(X, B),
    third_cousin(A, X),
    A\=B.

third_cousin_twice_removed(A, B):-
    grandfather(X, B),
    third_cousin(A, X),
    A\=B.

