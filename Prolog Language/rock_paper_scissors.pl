/*
 * rock_paper_scissors.pl
 * @author Gabriel Rivera Per-ossenkopp
 * November 29, 2014
 * Description: executes a rock paper scissors game.
 */
 
:- initialization(main).
 
%% main
% Serves as the main entry point of the application.
main :-
    processGame(0, 0).

%% processGame(+Wins, +Games)
processGame(Wins, Games) :-
    write('Enter your selection (0=Rock, 1=Paper, 2=Scissors): '),
    read(PlayerSelection), nl,
    PCSelection is random(3),
    determine_winner(PlayerSelection, PCSelection, Wins, Games).
    
%% determine_winner(+PlayerSelection, +PCSelection, +Wins, +Games).
% Determines the winner of the game and outputs it to the console,
% and raises the Wins and/or Games Count if the game is not a draw.
determine_winner(PlayerSelection, _, Wins, Games) :-
    (PlayerSelection < 0; PlayerSelection > 2),
    processGame(Wins, Games).
determine_winner(PlayerSelection, PCSelection, Wins, Games) :-
    hand(PlayerSelection, PlayerHand),
    hand(PCSelection, PCHand),
    write('My selection was '), write(PlayerSelection), write('='), write(PlayerHand),
    write('. The PCs Hand is '), write(PCSelection), write('='), write(PCHand),
    getWinLoseDraw(PlayerSelection, PCSelection, Wins, Games, ResultStr, ResultWin, ResultGame),
    write('. '), write(ResultStr), nl,
    continue_playing(ResultWin, ResultGame).

%% hand(+HandNumber, ?HandString).
% Returns the String representation of the Hand selected.
hand(0, 'Rock').
hand(1, 'Paper').
hand(2, 'Scissors').

%% getWinLoseDraw(+PlayerHand, +PCHand, +Wins, +Games, ?ResultString, ?ResultWin, ?ResultGame).
% Increments the Wins and Games if he won, Increments only the Games if he lost and returns
% the String representation of the results of Win, Lose or Draw.
getWinLoseDraw(0, 2, Wins, Games, 'You Win', ResultWin, ResultGame) :-
    ResultWin is Wins + 1,
    ResultGame is Games + 1.
getWinLoseDraw(1, 0, Wins, Games, 'You Win', ResultWin, ResultGame ) :-
    ResultWin is Wins + 1,
    ResultGame is Games + 1.
getWinLoseDraw(2, 1, Wins, Games, 'You Win', ResultWin, ResultGame) :-
    ResultWin is Wins + 1,
    ResultGame is Games + 1.
getWinLoseDraw(0, 1, Wins, Games, 'You Lose', ResultWin, ResultGame) :-
    ResultWin is Wins,
    ResultGame is Games + 1.
getWinLoseDraw(1, 2, Wins, Games, 'You Lose', ResultWin, ResultGame) :-
    ResultWin is Wins,
    ResultGame is Games + 1.
getWinLoseDraw(2, 0, Wins, Games, 'You Lose', ResultWin, ResultGame) :-
    ResultWin is Wins,
    ResultGame is Games + 1.
getWinLoseDraw(PlayerSelection, PCSelection, Wins, Games, 'Its a Draw', ResultWin, ResultGame) :-
    PlayerSelection = PCSelection,
    ResultWin is Wins,
    ResultGame is Games.

%% continue_playing (+Wins, +Games).
% Asks the player if he wants to continue playing
continue_playing(Wins, Games) :-
    write('Do you want to play again (y/n)? '),
    read(PlayAgainSel), nl,
    processContinue(PlayAgainSel, Wins, Games).

%% processContinue(+PlayAgainSelection, +Wins, +Games)
% processes the player input if he wants to continue playing.
processContinue(PlayAgainSel, Wins, Games) :-
    (PlayAgainSel = 'Y'; PlayAgainSel = 'y'),
    processGame(Wins,Games).
processContinue(PlayAgainSel, Wins, Games) :-
    (PlayAgainSel = 'N'; PlayAgainSel = 'n'),
    calcEndGame(Wins, Games).
processContinue(_, Wins, Games) :- continue_playing(Wins, Games).

%% calcEndGame (+Wins, +Games)
% Calculates the percentage of wins during the game.
calcEndGame(Wins, Games) :-
    PercentWins is (Wins / Games * 100),
    write('Thanks for playing! You won '), format('~1f',(PercentWins)),
    write('% of the games'), nl.

