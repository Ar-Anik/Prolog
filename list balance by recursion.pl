yinAndyang([], []).

yinAndyang([yin|Tail1], [yang|Tail2]):-
    yinAndyang(Tail1, Tail2).
