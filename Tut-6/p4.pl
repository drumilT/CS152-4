split([],0,[],[]):-!.
split([X|L],N,[X|L1],L2):- N1 is N-1 ,split(L,N1,L1,L2), N is N1+1.
split([X|L],0,[],[X|L2]):- split(L,0,[],L2).