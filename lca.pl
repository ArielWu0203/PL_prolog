% filename : lca.pl

make_tree(N) :-
    N < 1 ,!.
make_tree(N) :-
    write('N = '),write(N),nl,
    read(X),read(Y),nl,
    asserta(parant(X,Y)),
    N2 is N-1,make_tree(N2).
 
check_tree(M) :-
    M < 1, !.
check_tree(M) :-
    write('M = '),write(M),nl,
    read(X),read(Y),nl,
    write('LCA = '),
    lca(X,Y) ,!, nl,M2 is M-1,check_tree(M2).
check_tree(M) :-
    write('NULL'), nl ,nl, M2 is M-1,check_tree(M2).
    
ancester(A,B) :-
    parant(A,B).
ancester(A,B) :-
    parant(X,B),ancester(A,X).
lca(A,B) :- 
    A == B -> write(A),nl;
    ancester(A,B) -> write(A),nl;
    parant(X,A),lca(X,B).

main :-
    write('N = '),nl,
    read(N) ,nl,
    N2 is N-1,
    make_tree(N2),
    write('M = '),nl,
    read(M) ,nl,
    check_tree(M),halt.

:- initialization(main).
