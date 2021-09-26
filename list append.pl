appends([], L2, L2).

appends([H|T], L2, [H|L3]):-
    appends(T, L2, L3).

