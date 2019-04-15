myLength([],0):-!.
myLength( [X | L], N):- myLength(L, N1), N is N1+1.