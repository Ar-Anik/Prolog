onTheGuestList(Name, [Name|RestofTheList]).

onTheGuestList(Name, [FirstPerson|Rest]):-
    onTheGuestList(Name, Rest).

search(X, [H|_]).

search(X, [_|T]):-
    search(X, T).
