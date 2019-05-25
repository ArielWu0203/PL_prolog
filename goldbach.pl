% filename : goldbach.pl

% X is prime or not.
prime(2) :- !.
prime(3) :- !.
prime(X) :-
    integer(X) , X > 3 , X mod 2 =\= 0 , \+ has_factor(X,3).

% X has factor or not.
has_factor(X,Y) :-
    X mod Y =:= 0.
has_factor(X,Y) :-
    Y*Y<X , Z is Y+2 , has_factor(X,Z).

% goldbach
% N is even. X and Y is prime number. S is start.
goldbach(N) :- 
    N is 4 , write([2,2]),!.
goldbach(N) :-
    N mod 2 =:= 0 , X is 3 , for(N,X).
for(N,X) :-
    X > (N/2),!.
for(N,X) :-
    X2 is X+2, for(N,X2),test(N,X).

test(N,X) :-
    prime(X) , Y is N-X , prime(Y), ! , write([X,Y]).
test(N,X) :-
    !.

