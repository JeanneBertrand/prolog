palindrome([]).
palindrome([_]).
palindrome(P) :-
    append([X|Y], [X], P),
    palindrome(Y).

dispatch(X,L,Infeg,Sup) :-
    sublist(>=(X), L, Infeg),
    sublist(<(X), L, Sup). 

quicksorted([X], [X]).
quicksorted([], []).
quicksorted(Unsorted, Sorted) :-
    Unsorted=[P|_], 
    last(Unsorted, X), 
    dispatch((X+P)/2, Unsorted, Infeg, Sup), 
    quicksorted(Infeg, S1),
    quicksorted(Sup, S2), 
    append(S1, S2, Sorted). 

a_droite(X, L, D) :-
    append(_, [X|D], L). 

a_gauche(X, L, G) :-
    append(G, [X|_], L).

separer(X, L, G, D) :-
    append(G, [X|D], L). 

graphe(g1, [1,2,3,4,5,6], [[1,2],[1,3],[2,4],[3,4],[4,5],[4,6]]).

graphe(g2, [1,2,3,4,5,6], [[1,2],[1,3],[2,3],[2,4],[3,4],[4,1],[4,5],[4,6]]).

arc(G, O, E) :-
    graphe(G, _, A), 
    member([O,E], A).

existe_chemin(_, E, E). 
existe_chemin(G, O, E) :-
    arc(G, O, X), 
    existe_chemin(G, X, E). 

chemin(_, E, E, []). 
chemin(G, O, E, Ch) :-
    arc(G, O, X), 
    chemin(G, X, E, A),
    append([[O,X]], A, Ch).
