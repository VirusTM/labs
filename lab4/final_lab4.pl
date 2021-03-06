% 1
writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

r_list(N,N,L,L):-!.
r_list(N,I,VSL,L):-I1 is I+1, read(X),append(VSL,[X],VSL1),r_list(N,I1,VSL1,L).
read_list(N,L):-r_list(N,0,[],L).

% 2
s_list_D([],Sum,Sum):-!.
s_list_D([H|L],VSSum,Sum):-VSSum1 is VSSum + H, s_list_D(L,VSSum1,Sum).
sum_list_down(List,Sum):-s_list_D(List,0,Sum).

read_sum_write_list(N):-
    read_list(N,L),
    sum_list_down(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.

% 3
sum_list_up([],0):-!.
sum_list_up([H|List],Sum):-sum_list_up(List,SumNew),Sum is SumNew + H.

% 4.1
list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],Elem,Numb):-list_el_numb(List,Elem,NewNumb),Numb is NewNumb+1.

% 4.2
read__list_el_numb(N):-
    write("List: "),read_list(N,List),nl,
    write("Element: "),read(Elem),nl,
    write("Resul: "),list_el_numb(List,Elem,X),
    write(X),nl,false.

% 5
sproverka_elem:-write("Введите длинну списка: "),nl,read(N),write("Введите элементы списка: "),nl,read_list(N,List),write("Введите номер элемента: "),nl,read(Number),list_el_numb(List,Elem,Number),write(Elem),!.
proverka_elem:-write("Результат: ").

% 6
min_list_up([H],H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H<Min1 -> Min is H;Min is Min1).

% 7
min_list_down([],Min,Min):-!.
min_list_down([H|T],M,Min):-(H<M -> M1 is H;M1 is M),min_list_down(T,M1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).

% 8
proverka_min:-write("Количество элементов списка: "),nl,read(N),write("Введите элементы списка :"),nl,read_list(N,List),min_list_down(List,Min),write("Минимальный элемент списка - "),write(Min),!.

% 9
el_in_list(X,[X,_]):-!.
el_in_list(X,[_|T]):-el_in_list(X,T).

% 10
rev([],X,X):-!.
rev([H|T],VSL,X):-rev(T,[H|VSL],X).
reverse(L,X):-rev(L,[],X).

% 11
order([],[]):-!.
order([HS|Sublist],[HL|List]):-p(Sublist,List),HS =:= HL.

% 12
del_by_num([_|T],0,T):-!.
del_by_num([H|T],N,[H|T1]):-N1 is N-1,del_by_num(T,N1,T1).

% 13
del_repeat([],_,[]):-!.
del_repeat([H|T],El,[H|T1]):-H=\=El,del_repeat(T,El,T1),!.
del_repeat([_|T],El,T1):-del_repeat(T,El,T1).

% 14
u_n(_,[]):-!.
u_n(X,[H|T]):- X =\= H,u_n(X,T).
unique_num([H|T]):-u_n(H,T),unique_num((T)).
unique_num([]):-!.

% 15
del_rep([],[]):-!.
del_rep([H|T],[H|T1]):-del_repeat([H|T],H,New),del_rep(New,T1).

% 16
counter([],_,Count,Count):-!.
counter([H|T],El,Num,Count) :-
    (H =:= El -> NewNum is Num+1;NewNum is Num),
    counter(T,El,NewNum,Count).
counter(List,El,Count):-counter(List,El,0,Count).

% 17
lenght([],N,N):-!.
lenght([_|Tail],I,N):-NewI is I+1,lenght(Tail,NewI,N).
lenght(List,N):-lenght(List,0,N).



% 1.10
sameByMean([],_,0):-!.
sameByMean([H1|List1],List2,N):-sameByMean(List1,List2,N1),
    (member(H1,List2),N is N1+1;not(member(H1,List2)),N is N1),!.

sameByMean:-write("Количество элементов в первом массиве: "),read(N1),nl,
    write("Элементы первого массива: "),readList(N1,List1),nl,
    write("Количество элементов во втором массиве: "),read(N2),nl,
    write("Элементы второго массива: "),readList(N2,List2),nl,
    sameByMean(List1,List2,N),
    write("оценка: "),write(N),nl,!.



% 1.24
max(X,Y,X):-X>Y,!.
max(_,Y,Y):-!.

maxListUp([],0):-!.
maxListUp([H|List],Max):-maxListUp(List,NewMax),max(NewMax,H,Max).

twoMaxEl(List,Max1,Max2):-maxListUp(List,Max1),
    delAll(List,Max1,NewList),maxListUp(NewList,Max2),!.

twoMaxEl:-write("равно"),read(N),nl,
    write("обознач. "),readList(N,List),nl,
    twoMaxEl(List,Max1,Max2),write("Max1 = "),write(Max1),nl,
    write("Max2 = "),write(Max2).
