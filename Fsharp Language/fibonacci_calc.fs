(*
 * fibonacci_calc.fs
 * @author Gabriel Rivera Per-ossenkopp
 * November 7th, 2014
 * Description: This program executes the fibonacci sequence
 *)

let fibo_tail num = 
    let rec helper fterm sterm num = 
        match num with
        | 0 -> fterm
        | _ -> helper sterm (fterm + sterm) (num - 1)
    helper 0 1 num

let rec fibo_rec num =
    match num with
    | 0 -> 0
    | 1 -> 1
    | _ -> fibo_rec (num - 1) + fibo_rec (num - 2)

let start num =
    printfn "The number is %d" num
    if num >= 0 then
        printfn "Using tail-recursion the %d-th fibonacci sequence is %d" num (fibo_tail num)
        printfn "Using regular-recursion the %d-th fibonacci sequence is %d" num (fibo_rec num)
    else
        printfn "Error! You must use a positive integer"
