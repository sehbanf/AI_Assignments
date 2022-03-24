:- [library(csv)] .
:- [library(lists)] .
:- dynamic distance/3 .

:- op(1,'xfy','csv_') .

csv(FILE0)
:-
(start) csv_ (FILE0)
.

(start) csv_ (FILE0)
:-
csv:csv_read_file(FILE0,[HEADER|ROWss]) ,
row__to__list(HEADER,HEADERs) ,
(loop) csv_ (HEADERs,ROWss)
.

(loop) csv_ (_HEADERs,[])
:-
true
.

(loop) csv_ (HEADERs,[ROW|ROWss])
:-
row__to__list(ROW,ROWs) ,
lists:nth1(1,ROWs,CITY_A) ,
QUERY_A=(lists:nth1(NTH,ROWs,DISTANCE)) ,
QUERY_B=(NTH > 1) ,
QUERY_C=(lists:nth1(NTH,HEADERs,CITY_B)) ,
QUERY=(QUERY_A,QUERY_B,QUERY_C) ,
ASSERT=assertz(distance(CITY_A,CITY_B,DISTANCE)) ,
forall(QUERY,ASSERT) ,
(loop) csv_ (HEADERs,ROWss)
.

row__to__list(ROW,ROWs)
:-
ROW=..[_|ROWs]
.
dfs([[X|Y]|_],X,[X|Y]).
dfs([Y|Q],X,FP) :-
    add(Y,NP),
    append(NP,Q,NQ),
    dfs(NQ,X,FP).

bestfs([[X1|Y1]|_],X1,[X1|Y1]).
bestfs([Y1|Q],X1,FP1) :-
    add(Y1,NP1),
    append(Q,NP1,Q1),
    sorting(Q1,NQ1),
    bestfs(NQ1,X1,FP1).

add([N|Y],NP) :-
    findall([NN,N|Y],
            (distance(N,NN,_),
             \+ member(NN,Y)), NP).

sorting(L,L2) :-
    swapping(L,L1), !,
    sorting(L1,L2).
sorting(L,L).

swapping([[A1|B1],[A2|B2]|T],[[A2|B2],[A1|B1]|T]) :-
    hh(A1,W1),
    hh(A2,W2),
    W1>W2.
swapping([X|T],[X|V]) :-
    swapping(T,V).

hh(State, Value) :-
    h(State,Value),
    number(Value), !.
hh(State, Value) :-
   write('WrongFunction: '),
   write(h(State, Value)), nl,
   abort.

h(_,1).


