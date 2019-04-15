replicate(0,_,[]):-!.
replicate(N,X,[X|L]):- N1 is N-1, replicate(N1,X,L).

zip(_,[],[]):-!.
zip([],_,[]):-!.
zip([X|XS],[Y|YS],[(X,Y)|ZS]):- zip(XS,YS,ZS).
					
safepos((X,Y), (X1,Y1)):- \==(X,X1) , \==(Y,Y1) , Z is abs(Y-Y1) , Z1 is abs(X-X1), \==(Z,Z1).

makelist(0,[]) :- !.
makelist(N,L):- N1 is N-1, makelist(N1,L1), append(L1,[N],L). 

queens(1, [X]) :- makelist(8,L), !, member(X,L).
queens(N,L):- N1 is N-1, queens(N1,L1), makelist(N1, LN1), zip(LN1, L1, FL1), replicate(8,N, L8N), makelist(8,L8), zip(L8N, L8,Poses),
member((Row, Col),Poses), maplist(safepos((Row, Col)),FL1) , append(L1,[Col],L).