	

    % Palindrome
palindrome([]).
palindrome([X]).
palindrome(P) :-
    append([A|Y], [X], P),
    G=[A|Y],
    A is X,
    palindrome(Y).

quicksort2([],Acu,Acu) .
quicksort2([A],Acu,[A|Acu]).
quicksort2(Unsorted, Acu, Sorted) :-
    append([A|_],[C], Unsorted),
    D is (A+C)/2,
    dispatch(D,Unsorted,Inf, Sup),
    quicksort2(Inf, Acu,),
    quicksort2(Sup, Acu,Qb).
%permutation(P, X), 
 %P=X.


    % Description de graphes
	% ----------------------
	% Chaque clause donne le nom du graphes, la liste des sommets et la liste des arcs.
	% g1 est un graphe acyclique
	% g2 contient des cycles
	

graphe(g1, [1,2,3,4,5,6], [[1,2],[1,3],[2,4],[3,4],[4,5],[4,6]]).

graphe(g2, [1,2,3,4,5,6], [[1,2],[1,3],[2,3],[2,4],[3,4],[4,1],[4,5],[4,6]]).
