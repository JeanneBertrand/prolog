disque(a,[-1,0,0,0,0,0]).
disque(b,[-1,-1,0,0,0,0]).
disque(c,[-1,0,-1,0,0,0]).
disque(d,[-1,0,0,-1,0,0]).
disque(e,[-1,-1,-1,0,0,0]).
disque(f,[-1,-1,0,-1,0,0]).
disque(g,[-1,0,-1,0,-1,0]).
disque(h,[-1,-1,-1,-1,0,0]).
disque(i,[-1,-1,-1,0,-1,0]).
disque(j,[-1,-1,0,-1,-1,0]).
disque(k,[-1,-1,-1,-1,-1,0]).
disque(l,[-1,-1,-1,-1,-1,-1]).

liste_des_disques(L):-
    findall(X,disque(X, _), L).

rotation_droite(M, R) :-
    append(X, [Y], M),
    R=[Y|X]. 

rotation_gauche([A|B],R) :-
    append(B,[A],R).

orienter2(_, M1, M1, 0).
orienter2(Ref, M1, M2, N) :-
    rotation_gauche(M1, X), 
    X\=Ref, 
    orienter2(Ref, X, M2, P),
    N is P+1.

orienter(M1, M2, N) :-
    orienter2(M1, M1, M2, N). 

empilement_secteur(0, 0, 0).
empilement_secteur(2, -1, 1).
empilement_secteur(0, -1, 2).
empilement_secteur(1, -1, 0).

empilement([], [], []). 
empilement([P|R], [P1|R1], [N|R2]) :-
    empilement_secteur(P, P1, N), 
    empilement(R, R1, R2).

etat_initial(I) :-
    liste_des_disques(L), 
    I=[[0,0,0,0,0,0], L].

etat_final([[0,0,0,0,0,0], []]).

arc([S1, L1], [S2, L2], [D,N]) :-
    empilement(S1, X, S2),
    disque(D,Y),
    (S1=[0,0,0,0,0,0] -> N is 0; true),
    orienter(Y,X,N),
    append(B, [D|C], L1),
    append(B, C, L2).

find_path(E,E,[]).
find_path(Ei, Ef, [A|So]):-
    arc(Ei,E,A),
    find_path(E,Ef,So).


solution(S) :-
    etat_initial(I), 
    etat_final(F), 
    find_path(I,F,S).
    




































