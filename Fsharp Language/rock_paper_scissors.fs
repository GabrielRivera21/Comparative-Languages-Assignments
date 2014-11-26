(*
 * rock_paper_scissors.fs
 * @author Gabriel Rivera Per-ossenkopp
 * 841-11-6930
 * November 18, 2014
 * Description: This program executes a rock, paper scissors game.
 *)
module rock_paper_scissors

open System //for .NET Console

//Seed in order to select random numbers.
let rnd = Random () 

//Determines if the player wins by adding 
//a 1 if he wins, a 0 if he loses or a -1 if its a draw to a List
let determine_winner playerHand pcHand game = 
    match playerHand, pcHand with
    | 0, 2 -> 1::game
    | 1, 0 -> 1::game
    | 2, 1 -> 1::game
    | 2, 0 -> 0::game
    | 0, 1 -> 0::game
    | 1, 2 -> 0::game
    | _, _ -> -1::game

//Returns the word of the hand the player and the pc selected.
let hand = function
    | 0 -> "rock"
    | 1 -> "paper"
    | 2 -> "scissors"
    | _ -> "Won't Happen :)"

//Returns the result of the game if he won, lost or if it was a draw
let results = function
    | 0 -> "You Lose"
    | 1 -> "You Win"
    | -1 -> "Its a Draw"
    | _ -> "Won't Happen :)"

//Prints out the result of the current play
//and returns the list of the result if he won, lost or draw.
let show_results playerHand pcHand game =  
    Console.WriteLine ("My Selection was {0}={1}. The PC's hand is {2}={3}. {4}\n", playerHand, (hand playerHand), 
                                        pcHand, (hand pcHand), (results (List.head game)))
    game

//Calculates the percentage of the wins of all the games the player made by
//Filtering the draws which were -1, then acc all the list, dividing by the
//length of the filtered list which were all the valid games of wins and losses.
let calc_game_end game = 
    let win = List.filter(fun elem -> elem <> -1) game
    (List.sum win |> float)/ (float (List.length win)) * 100.0

//Prints out the percentage of wins of the whole game.
let end_game game = 
    Console.WriteLine ("Thanks for playing. You won {0:F1}% of the games.", (calc_game_end game))

//a function that asks the player if he wants to continue playing
//the game or not
let rec continue_playing game = 
    if(List.isEmpty game) then
        true
    else
        Console.WriteLine "Do you want to play again (y/n)?"
        match Console.ReadLine() with
        | "y" -> true
        | "Y" -> true
        | "n" -> false
        | "N" -> false
        | _ -> continue_playing game

//The main game selection, allowing the player to select his hand and then
//calls a set of functions to show results.
let rec processGame game = 
    if (continue_playing game) then 
        Console.WriteLine "Enter your selection (0=Rock, 1=Paper, 2=Scissors): "
        let pcHand = rnd.Next(3)
        match (Console.ReadLine() |> int) with
        | 0 -> determine_winner 0 pcHand game |> show_results 0 pcHand |> processGame
        | 1 -> determine_winner 1 pcHand game |> show_results 1 pcHand |> processGame
        | 2 -> determine_winner 2 pcHand game |> show_results 2 pcHand |> processGame
        | _ -> processGame game 
    else
        (end_game game)

//Serves as the applications main entry point.  
let main () =
    processGame []
    Console.ReadKey () |> ignore

//Calls the main function.
main()