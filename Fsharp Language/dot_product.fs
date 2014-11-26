(*
 * dot_product.fs
 * @author Gabriel Rivera Per-ossenkopp
 * November 9, 2014
 * Description: multiply two lists doing a vector dot product.
 *)

let mult_HO list1 list2 =
    List.fold2(fun acc elem1 elem2 -> acc + elem1 * elem2) 0 list1 list2

let mult_tail list1 list2 =
    let rec helper list1 list2 acc =
        match list1, list2 with
        | [], [] -> acc
        | [], _ -> acc
        | _ , [] -> acc
        | hd1 :: tl1, hd2 :: tl2 -> helper tl1 tl2 (acc + hd1 * hd2)
    helper list1 list2 0

let rec mult_rec list1 list2 =
    match list1, list2 with
    | [], [] -> 0
    | [], _ -> 0
    | _, [] -> 0
    | hd1 :: tl1, hd2 :: tl2 -> (hd1 * hd2) + (mult_rec tl1 tl2)

let start list1 list2 = 
    printfn "Using the Higher Order function: the dot product is %d" (mult_HO list1 list2)
    printfn "Using the Tail Recursive function: the dot product is %d" (mult_tail list1 list2)
    printfn "Using the Regular Recursive function: the dot product is %d" (mult_rec list1 list2)
