/*
 * queue_menu.pl
 * This program manages a menu of common queue operations.
 */

:-use_module(queue_lst).
:-initialization(main).

%% main
%  Serves as an entry point of the program.
%  Creates an empty queue and manages the menu.
main :-
    empty_queue(Queue),
    menu(Queue).

%% menu(+Queue)
%  Displays the menu, reads the selection and process this selection.
menu(Queue) :-
    write('\n\tQueue Menu\n\n'),
    write('1. Enqueue an element\n'),
    write('2. Dequeue an element\n'),
    write('3. View the contents\n'),
    write('4. Quit\n'),
    write('Enter your selection (1-4, ending with a full stop): '),
    read(Selection), nl,
    selection(Selection, Queue).

%% selection(+Selection, +Queue)
%  Processes the menu selection with the current queue.
selection(1, Queue) :-
    write('Enter an element (end with full stop): '),
    read(Elem),
    enqueue(Queue, Elem, NewQueue),
    write(Elem), write(' has been enqueued.\n'),
    menu(NewQueue).

selection(2, Queue) :-
    catch(
        (
            dequeue(Queue, Elem, NewQueue),
            write(Elem), write(' has been dequeued.\n')
        ),
        empty_exception(Message),
        (
            write('Cannot dequeue: '), write(Message), nl,
            NewQueue = Queue
        )
    ),
    menu(NewQueue).

selection(3, Queue) :-
    empty_queue(Queue),
    write('Cannot show: queue is empty.\n'),
    menu(Queue).

selection(3, Queue) :-
    \+ empty_queue(Queue),
    write('These are the contents of the queue: '),
    iterate_queue(Queue, write_element), nl,
    menu(Queue).

selection(4, _) :-
    write('Thanks for using this program.\n').

selection(Selection, Queue) :-
    (
        Selection < 1
        ;
        Selection > 4
    ),
    write('Error! Selection must be between 1 and 4.\n'),
    menu(Queue).

%% write_element(+Elem)
%  Displays an element followed by a space.
write_element(Elem) :-
    write(Elem), write(' ').