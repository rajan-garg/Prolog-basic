list1(1, 'Abhinav', 'abhinav@gmail.com', 'Regular').
list1(2, 'Abhishek', 'abhi2014@gmail.com', 'Part time').
list1(3, 'Akash', 'akaaash@gmail.com', 'Regular').
list1(4, 'Rajan', 'rajan.garg@gmail.com', 'Regular').
list1(5, 'Raj', 'raj.s@gmail.com', 'Foreign').
list1(6, 'Rahul', 'rahul.21@gmail.com', 'Regular').
list1(7, 'Ankit', 'ankit.k@gmail.com', 'QIP').
list1(8, 'Sahil', 'sahil51@gmail.com', 'Regular').
list1(9, 'Karan', 'karan00@gmail.com', 'Foreign').
list1(10, 'Rohan', 'rohan@gmail.com', 'Regular').
list2(1, 'Abhinav', 'Regular','A', '').
list2(2, 'Abhishek', 'Part time','B', 'P').
list2(3, 'Akash', 'Regular','C', 'Q').
list2(4, 'Rajan', 'Regular','D', 'R').
list2(5, 'Raj', 'Foreign','A', '').
list2(6, 'Rahul', 'Regular','C', 'P').
list2(7, 'Ankit', 'QIP','D', 'R').
list2(8, 'Sahil', 'Regular','B', 'Q').
list2(11, 'Jayesh', 'Foreign','A', 'S').
list2(12, 'Raj', 'Foreign','A', 'S').

printfunc(N, R, E, T, S, C) :-         											%prints the data of student
	write("Name":N),nl,
        write("Roll":R),nl,
        write("Email":E),nl,
        write("Type":T),nl,
        write("Supervisor":S),nl,
        write("Co-supervisor":C),nl.

searchByName(Name1):-
        
	list1(Roll, Name1,Email, Type) ,											% checks if name is present in list1
		(
		 list2(Roll, Name1, Type, Sup,Cosup) -> 								% checks if name is present in list2
			printfunc(Name1, Roll, Email, Type, Sup, Cosup)						% prints if student data in both lists
		;	
			printfunc(Name1, Roll, Email, Type, '', '')							% prints if student data is only list1
		);
	list2(Roll,Name1,Type,Sup, Cosup),											% checks if name present in list2
		(
		 not(list1(Roll,Name1,Email,Type)) ->									% checks if not present in list1 
			printfunc(Name1, Roll, '', Type, Sup, Cosup)						% prints if present in only list2
		).

searchByRoll(Roll1):-

	list1(Roll1, Name,Email, Type) ,											% checks if roll is present in list1
		(
		 list2(Roll1, Name, Type, Sup,Cosup) ->  								% checks if roll is present in list2
			printfunc(Name, Roll1, Email, Type, Sup, Cosup)						% prints if student data in both lists
		;
			printfunc(Name, Roll1, Email, Type, '', '')							% prints if student data is only list1
		);
	list2(Roll1,Name,Type,Sup, Cosup),											% checks if roll present in list2
		(
		 not(list1(Roll1,Name,Email,Type)) ->									% checks if not present in list1 
			printfunc(Name, Roll1, '', Type, Sup, Cosup)						% prints if present in only list2
		).

