parent(jatin,avantika).
parent(jolly,jatin).
parent(jolly,kattappa).
parent(manisha,avantika).
parent(manisha,shivkami).
parent(bahubali,shivkami).
male(kattappa).
male(jolly).
female(shivkami).
female(avantika).
male(bahubali).

uncle(X,Y) :- parent(Z,X), parent(W,Y) , parent(Z,W), male(Z), X\=W.			%parent of Y and grand parent of X should be same person.	
halfsister(X,Y) :- parent(Z,X), parent(Z,Y),parent(R,X),parent(S,Y), 
					female(X), X\=Y, Z\=R, Z\=S, R\=S.							% X,Y have only one same parent.
