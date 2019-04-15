%boat(M,C):- M>=0 , C>=0, T=M+C, T < 3.
boat(1,0).
boat(0,1).
boat(1,1).
boat(2,0).
boat(0,2).

safe_bank(M,C):- M>= C ,  M>=0 , C>=0.
safe_bank(0,C):- C >= 0 , C< 4 , ! .

state([0,0,right], Completed , Completed) :-!.
state([ML,CL,left], Completed, Journeys) :- boat(M,C) , 
MLN = ML - M , 
MRN = 3 - MLN , 
CLN = CL - C , 
CRN = 3 - CLN,
safe_bank(MLN,CLN), 
safe_bank(MRN,CRN) , 
not( member([MLN,CLN,right], Completed)), 
state([MLN,CLN,right],[[MLN,CLN,right]|Completed], Journey).

state([ML,CL,right], Completed, Journeys) :- boat(M,C) , 
MLN = ML + M , 
MRN = 3 - MLN , 
CLN = CL + C , 
CRN = 3 - CLN,
safe_bank(MLN,CLN), 
safe_bank(MRN,CRN) , 
not( member([MLN,CLN,left], Completed)), 
state([MLN,CLN,left],[[MLN,CLN,left]|Completed], Journey).

ans(P):- state([3,3,left],[[3,3,left]], P), 
		reverse(P,P1),
		print(P1), 
		nl, 
		fail.