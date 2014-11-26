(*
 * list_oddcount.fs
 * @author Gabriel Rivera Per-ossenkopp
 * November 9, 2014
 * Description: This program retrieves the number of odd elements in a list
 *)

let count_odds lst = 
    List.filter (fun elem -> elem % 2 <> 0) lst |> List.length

let start lst =
    printfn "The number of odd elements is %d" (count_odds lst)

