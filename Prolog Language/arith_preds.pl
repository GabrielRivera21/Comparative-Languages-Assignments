/**
 * arith_preds.pl
 * @author Gabriel Rivera Per-ossenkopp
 * November 29, 2014
 * Description: This perfomes some arithmetic methods using predicates
 */
 
%% fibo_rec (+nthTerm, ?Result)
% Calculates the Nth Term of the Fibonnaci Sequence using regular recusion.
fibo_rec(Num, Result) :-
    Num > 1,
    NumMinus1 is Num - 1,
    NumMinus2 is Num - 2,
    fibo_rec(NumMinus1, FTerm),
    fibo_rec(NumMinus2, STerm),
    Result is FTerm + STerm.

fibo_rec(0, 0).
fibo_rec(1, 1).

%% fibo_tail (+nthTerm, ?Result).
% Calculates the Nth-Term of the Fibonacci Sequence using tail-Recursion
fibo_tail(Num, Result) :-
    fibo_helper(Num, 0, 1, Result).

%fibo_helper(+Num, +FTerm, +STerm, ?Result)
fibo_helper(Num, FTerm, STerm, Result) :-
    Num > 0,
    NumMinus1 is Num - 1,
    NewFTerm is STerm,
    NewSTerm is FTerm + STerm,
    fibo_helper(NumMinus1, NewFTerm, NewSTerm, Result).
    
fibo_helper(0, FTerm, _, FTerm).

%% list_min_rec (+List, ?Min)
% Returns the minimum value of a List using regular Recursion
list_min_rec([Head|Tail], Min) :-
    list_min_rec(Tail, NewMin),
    Min is min(Head, NewMin).

list_min_rec([Min], Min).

%% list_min_tail(+List, ?Min).
% Returns the minimum value of a List using Tail Recursion.
list_min_tail([Head|Tail], Min) :-
    list_min_helper(Tail, Head, Min).

% list_min_helper (+List, +NewMinimum, ?Min)
list_min_helper([Head|Tail], CurrVal, Min) :-
    NewMin is min(CurrVal, Head),
    list_min_helper(Tail, NewMin, Min).

list_min_helper([], Min, Min).

%% scalar_mult_rec(+Num, +List, ?Result)
% Result of multiplying an integer by each member of a list of integers
% representing a vector using Regular-Recursion
scalar_mult_rec(Num, [Head|Tail], Result) :-
     NewHead is Num * Head,
     scalar_mult_rec(Num, Tail, NewList),
     Result = [NewHead|NewList].

scalar_mult_rec(_,[], []).

%% scalar_mult_tail (+Num, +List, ?Result)
% Result of multiplying an integer by each member of a list of integers
% representing a vector using Tail-Recursion
scalar_mult_tail(Num, List, Result) :-
    scalar_helper(Num, List, [], Result).

% scalar_helper (+Num, +List, +NewList, ?Result).
scalar_helper(Num, [Head|Tail], NewList, Result) :-
    NewHead is Num * Head,
    scalar_helper(Num, Tail, [NewHead|NewList], Result).

scalar_helper(_, [], NewList, Result) :- reverse(NewList, Result).

%% dotproduct_rec (+List1, +List2, ?Result)
% dot product of two lists representing vectors of the same length
% using Regular Recursion
dotproduct_rec([Head1|Tail1], [Head2|Tail2], Result) :-
    dotproduct_rec(Tail1, Tail2, Acc),
    Result is Acc + Head1 * Head2.

dotproduct_rec([], [], 0).

%% dotproduc_tail(+List1, +List2, ?Result)
% dot product of two lists representing vectors of the same length
% using Tail-Recursion
dotproduct_tail(List1, List2, Result) :-
    dotproduct_helper(List1, List2, 0, Result).

% dotproduct_helper(+List1, +List2, +Acc, ?Result).
dotproduct_helper([Head1|Tail1], [Head2|Tail2], Acc, Result) :-
    NewAcc is Acc + Head1 * Head2,
    dotproduct_helper(Tail1, Tail2, NewAcc, Result).

dotproduct_helper([],[], Acc, Acc).