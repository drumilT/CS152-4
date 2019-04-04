son (bhim , pandu).
son (yudhishtir, pandu).
    son (duryodha, dhritrarashtra).
    brother (pandu, dhritarashtra).
    %brother(X,Y) :- brother (Y,X).
    brother (X,Y) :- sson(X,Z), son (Y,Z), \==(X,Y).

    uncle (X,Y) :- son(Y,F), brother(F, X).
    %uncle (X,Y) :- son(Y,F), brother(X,F)
    
    
					       
