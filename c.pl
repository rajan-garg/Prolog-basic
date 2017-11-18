path(1,2).
path(1,7).
path(2,1).
path(2,8).
path(3,4).
path(3,9).
path(4,3).
path(4,10).
path(4,5).
path(5,4).
path(5,6).	
path(5,11).
path(6,5).
path(6,12).
path(7,1).
path(7,13).
path(7,8).
path(8,2).
path(8,14).
path(8,7).
path(9,3).
path(9,10).
path(10,4).
path(10,9).
path(10,11).
path(11,10).
path(11,12).
path(11,5).	
path(12,6).
path(12,11).
path(12,18).
path(13,7).
path(13,14).
path(13,19).
path(14,13).
path(14,8).	
path(14,15).
path(15,14).
path(15,16).
path(16,15).
path(16,22).
path(17,23).
path(17,11).
path(17,18).
path(18,12).
path(18,17).
path(19,25).
path(19,20).
path(19,13).
path(20,19).
path(20,26).
path(21,27).
path(21,22).	
path(22,28).
path(22,21).
path(22,23).
path(23,22).
path(23,17).
path(24,30).
path(25,19).
path(25,26).
path(25,31).
path(26,20).
path(26,25).
path(26,32).	
path(27,21).
path(27,28).
path(28,22).
path(28,27).
path(29,30).
path(29,35).
path(30,36).
path(30,29).
path(30,24).
path(31,25).
path(31,32).
path(32,26).
path(32,31).
path(32,33).
path(33,32).
path(33,34).
path(34,35).
path(34,33).
path(35,34).
path(35,36).
path(35,29).
path(36,30).
path(36,35).

add :- nb_getval(counter, C), CNew is C + 1, nb_setval(counter, CNew).				% increases the count of number of paths

printC :- nb_getval(counter, C),  write("Total number of paths" : C),nl.			% prints nummber of paths

printL :- nb_getval(mylist, L), write("Shortest path" : L),nl.						% prints shortest path

comp(Y) :- nb_getval(minlist, X), length(Y,M), 										
          (
            M < X -> nb_setval(minlist, M), nb_setval(mylist, Y)					% compares new path to previous shortest path
            ;
            nb_setval(minlist,X)													% update the shortest path
            )
            .

discover_maze :- route(1,12), route(1,24),route(1,36),route(13,12),route(13,24),		% calls all routes b/w destination points
				route(13,36),route(25,12),route(25,24),route(25,36). 

route(A,B) :- nb_setval(mylist,[]), nb_setval(minlist, 36) , nb_setval(counter, 0), 	% initialize shortest path, counter
  walk(A,B,[]), fail; write(A),write("--->"), write(B),nl,printC, printL				% traverse through all the paths by calling walk
  .            

walk(A,B,V) :-  							 
  path(A,X) ,     							% path from A to some intermediate point X
  not(member(X,V)) , 						% checks if X is not still visited
  (                  
    B = X -> add, comp([A|V])				% if X is destination point, then count it as new path
  ;                  
    walk(X,B,[A|V]) 						% walk from X-B and A is visited.
  )                  
  .


