	% First definition of factorial(N)
	% 2 clauses : stopping clause and recursive clause
	% factorial(0) = 1 
	% factorial(N) = N*factorial(N-1)
    %le coupe choix s'agit de la condition d'arret de la fonction recursive
    %
	
fact(0,1) :- !.				

fact(N,F) :-				
    N1 is N-1,
    fact(N1,F1),
    F is N*F1.

facto(N, F) :- 
    N>0, 
    N1 is N-1,
    fact(N1,F1),
    F is N*F1.
facto(0,1).

% ?- fact(-10,F).
% ERROR: Out of local stack
% ?- facto(-10,F).
% false.

somme([],0) :- !.
somme(L, S) :-
    L=[P|R],
    somme(R, S1),
    S is P+S1.


somme2([],S,S).
somme2([X|L],I,S) :-
    J is X+I,
    somme2(L,J,S).

%?- somme2([1,2,3,4], 0, S).
%S = 10.
%
%?- somme2([1,2,3,4], 0, 9).
%false.
%
%?- somme2([1,2,3,4],  123, S).
%S = 133.
%
%?- somme2([1,2,3,4],  0, 10).
%true.


/*multi
line
comment
*/


fibo(0,0).
fibo(1,1).
fibo(N, F) :-
    N1 is N-1,
    N2 is N-2,
    fibo(N1,F1),
    fibo(N2, F2),
    F is F1+F2.

/* à fibo(30,F) le programme produit un Out Of Stack error*/

fiboplus(N,F, F1) :-
    N>1, 
    N1 is N-1,
    fiboplus(N1, F1, F2),
    F is F1+F2.
fiboplus(1,1,0).
fiboplus(0,0,_).











































