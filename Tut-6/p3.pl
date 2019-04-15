myLast(X,[X]):-!.

myLast(X,[Y|L]):-myLast(X,L).