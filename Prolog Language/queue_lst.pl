/*
 * queue_lst.pl
 * @author Gabriel Rivera Per-ossenkopp
 * Last Modified: November 29, 2014
 * This module implements a generic queue using a list.
 */

:- module(queue,
          [empty_queue/1, enqueue/3, dequeue/3, iterate_queue/2]).

%% empty_queue(?Queue)
%  Creates an empty queue or checks if it is empty.
empty_queue(queue_list([], [])).

%% enqueue(+Queue, +Top, ?NewQueue)
%  Adds an element at the rear end of a queue.
enqueue(queue_list(RemoveElems, AddElems), Top, queue_list(RemoveElems, [Top|AddElems])).

%% dequeue(+Queue, ?Top, ?NewQueue)
%  Removes the front element from a queue.  Thows an exception if the
%  queue is already empty.
dequeue(queue_list([], []), _, _) :- throw(empty_exception('Queue is Empty')).
dequeue(queue_list([Top|TailRemoveElems], AddElems), Top, queue_list(TailRemoveElems, AddElems)).
dequeue(queue_list([], AddElems), Top, NewQueue) :-
    fillRemoveElems(queue_list([], AddElems), TmpQueue),
    dequeue(TmpQueue, Top, NewQueue).

%% iterate_queue(+Queue, +Visit)
%  Iterates through a queue using a visit procedure.
iterate_queue(queue_list([Top|RemoveElems], AddElems), Visit) :-
    Goal =.. [Visit, Top],
    call(Goal),
    iterate_queue(queue_list(RemoveElems, AddElems), Visit).
iterate_queue(queue_list([], AddElems), Visit) :-
    AddElems \= [],
    fillRemoveElems(queue_list([], AddElems), TmpQueue),
    iterate_queue(TmpQueue, Visit).

iterate_queue(queue_list([],[]), _).

%% fillRemoveElems(+Queue, ?NewQueue).
% Fills the Remove Elements List of the Queue.
% Note: This is only called when RemoveElements list is empty
% and the AddElements List has elements.
fillRemoveElems(queue_list(_, AddElems), NewQueue) :-
    fillRemoveHelper(queue_list(_, AddElems), queue_list([], []), NewQueue).

%% fillRemoveHelper(+Queue, +Acc, ?NewQueue)
% Helper Method for FillRemoveElems.
fillRemoveHelper(queue_list([], [Top|AddElems]), queue_list(RemList, []), NewQueue) :-
    NewList = [Top|RemList],
    fillRemoveHelper(queue_list([], AddElems), queue_list(NewList, []), NewQueue).

fillRemoveHelper(queue_list(_, []), queue_list(RemList, _), queue_list(RemList, [])).