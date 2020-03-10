'silnia(0,1).
silnia(N,Nsil) :-
	N>0,
	M is N-1,
	silnia(M,Msil),
	Nsil is N*Msil.

fib(0,0).
fib(1,1).
fib(N,Nfib) :-
	N>1,
	A is N-1,
	fib(A,Afib),
	B is N-2,
	fib(B,Bfib),
	Nfib is Afib + Bfib.

%bramka and	
brAnd(0,0,0).
brAnd(1,0,0).
brAnd(0,1,0).
brAnd(1,1,1).

%bramka or	
brOr(0,0,0).
brOr(1,0,1).
brOr(0,1,1).
brOr(1,1,1).

%bramka not	
brNot(0,1).
brNot(1,0).

uklad(A,B,C,D,E,F,G) :-
	brAnd(A,B,E),
	brAnd(C,D,F),
	brAnd(E,F,G).
	
u(A,B,C,D,E,F,G,H,I,J) :-
	brOr(A,B,F),
	brAnd(C,D,G),
	brOr(F,G,H),
	brNot(H,I),
	brOr(I,E,J).