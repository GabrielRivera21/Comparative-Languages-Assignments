(*
 * list_min.fs
 * @author Gabriel Rivera Per-ossenkopp
 * November 8, 2014
 * Description: Finds the minimum element by varying methods.
 *)

let findMinByHO lst =
    List.fold (fun min elem -> if elem < min then elem else min) (List.head lst) lst
    
let findMinByTail lst = 
    let rec helper lst minimum =
        match lst with
        | [] -> minimum
        | hd :: tl -> helper tl (if (hd < minimum) then hd else minimum)
    helper lst (List.head lst)

let rec findMinByRec lst =
    match lst with
    | [] -> failwith "Empty"
    | [minimum] -> minimum
    | hd::tl -> if hd < (findMinByRec tl) then hd else findMinByRec tl
    
let start lst = 
    printfn "The List is %A" lst
    printfn "The min element of this list using List.min is %d" (List.min lst)
    printfn "The min element of this list using Higher-Order Function is %d" (findMinByHO lst)
    printfn "The min element of this list using tail-recursion is %d" (findMinByTail lst)
    printfn "The min element of this list using regular-recursion is %d" (findMinByRec lst)

