domains
  symptom = symbol  
  cause = symbol

predicates
%  trieu_chung()
%  chan_doan()
  
  start
  menu
  hoi_a
  hoi_b
  hoi_c
%  ask(string)

clauses

 % ask(Question) :-
  %  write(Question), nl,
 %   readln(Answer),
%    (Answer = y -> true ; false).


  start :-
    makewindow(1,2,2, "Chuan doan hong xe may",0,0,25,80),
    menu,
    hoi_a.
  menu :-
    write("This is a menu"), nl.
  
%  hoi(nodecha, nodecon, ans) :-
  
  hoi_a :-
    write("a dung ko? (y/n)"),
    readln(Ans),
    Ans = "y",
    hoi_b.
    
  hoi_b :-
    write("b dung ko? (y/n)"),
    readln(Ans),
    ((Ans = "y",
    hoi_c);
    (Ans = "n",
    !))    
    .
    
  hoi_c :-
    write("c dung ko? (y/n)").
%    readln(Ans).
  

goal
  start.