(*
 * alg_list_test.fs
 * This program demonstrates how to use lists defined as an
 * algebraic data type.
 *)
module alg_list_test

open System                 // for Console class methods
open FunctionalCollections  // for AlgebraicList module functions 

let show_list (msg : string) (list : int AlgebraicList.alg_list) =
    if AlgebraicList.isEmpty list then
        Console.WriteLine ("The list is empty.")
    else
        Console.Write (msg)
        AlgebraicList.iter (fun (x : int) -> Console.Write("{0} ", x)) list
        Console.WriteLine ()

// Serves as an entry point for the program.
let start () =
    let lst1 = AlgebraicList.empty
    show_list "List is " lst1

    let lst2 = AlgebraicList.init 5 (fun x -> (x + 1) * 10)
    show_list "After initializing to multiples of 10, list is " lst2

    let lst3 = AlgebraicList.addHead 5 lst2
    show_list "After adding 5 to head, list is " lst3

    let lst4 = AlgebraicList.remove 30 lst3
    show_list "After removing 30, list is " lst4

    Console.WriteLine("The head is {0}", AlgebraicList.head lst4)
    show_list "The tail is " (AlgebraicList.tail lst4)

    Console.WriteLine("The length is {0}", AlgebraicList.length lst4)

    Console.WriteLine("The sum of the elements is {0}",
        (AlgebraicList.fold ( + ) 0 lst4))

    Console.WriteLine ("Does it contains 20? {0}", 
        (AlgebraicList.isMember 20 lst4))

    lst4 |> AlgebraicList.rev
         |> show_list "The elements in reverse are "

    lst4 |> AlgebraicList.map (fun x -> x * x)
         |> show_list "The square of the list elements is "

    lst4 |> AlgebraicList.filter (fun x -> x % 4 = 0)
         |> show_list "The elements that are multiples of 4 are "

    let lst5 = AlgebraicList.init 5 (fun x -> 100 - x * 10)
    show_list "\nThe new list is " lst5

    show_list "After appending the new list to the list "
        (AlgebraicList.append lst4 lst5)
         
    Console.ReadKey () |> ignore

// Calls the start function.
start ()
