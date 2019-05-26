% filename : reach.pl
is_node(0,0).

e_dec(N,E) :-
    N > 0, E < 1,!.
e_dec(N,E) :-
    write('E = '),write(E),nl,
    read(X),read(Y),nl,
    asserta(edge(X,Y)), asserta(edge(Y,X)),
    E2 is E-1,e_dec(N,E2).

m_dec(M) :-
    M < 1,!.
m_dec(M) :-
    write('M = '),write(M),nl,
    read(X),read(Y),nl,
    (
        group(X,Y) -> write('yes'),nl,nl;
        \+group(X,Y) ->  write('no'),nl,nl
    ),
    M2 is M-1,m_dec(M2).

group(A,B) :-
    walk(A,B,[]).
walk(A,B,V) :-
    edge(A,X),not(member(X,V)),
    (
        B = X;
        walk(X,B,[A|V])
    ).

main :-
    write('N & E = '),nl,
    read(N),read(E),
    (
        N<1 -> write('N is smaller than 1.'),nl,halt;
        N>0 -> true
    ),
    e_dec(N,E) -> write('M = '),nl,read(M),m_dec(M),
    halt.

:- initialization(main).
