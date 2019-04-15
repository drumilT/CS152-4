


occupancy(B):- B = [[sanket,N1],[ankush,N2],[ashwin,N3],[umang,N4],[krishna,N5]], member([_,1],B),member([_,2],B),member([_,3],B),member([_,4],B),member([_,5],B) , \==(N3,5) ,\==(N2,1) ,\==(N4,5) ,\==(N4,1) ,abs(N4-N5)>1,abs(N4-N2)>1,N1>N2, !.