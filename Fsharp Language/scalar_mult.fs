(*
 * scalar_mult.fs
 * @author Gabriel Rivera Per-ossenkopp
 * November 9, 2014
 * Description: this program multiplies the scalar multiplies
 *)

let scalar_map num list =
    List.map (fun elem -> num * elem) list

let scalar_tail num list = 
    let rec helper n lst newlst =
        match lst with
        | [] -> newlst
        | hd :: tl -> helper n tl (newlst @ [(hd * n)])
    helper num list []

let rec scalar_rec num = function
    | [] -> []
    | hd :: tl -> [(hd * num)] @ (scalar_rec num tl)

let start n lst =
    printfn "Using a higher-order function: The scalar multiplication is %A" (scalar_map n lst)
    printfn "Using a tail recursive helper function: The scalar multiplication is %A" (scalar_tail n lst)
    printfn "Using a regular recursion function: The scalar multiplication is %A" (scalar_rec n lst)