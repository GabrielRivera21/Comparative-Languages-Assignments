(*
 * alg_list.fs
 * @author Gabriel Rivera Per-ossenkopp
 * 841-11-6930
 * November 21, 2014
 * Description: This source file implements the algebraic type data structure List.
 *)
namespace FunctionalCollections

//Defines an Empty List exception
exception EmptyList of string

module AlgebraicList =
    // Declares the alg_list algebraic data type.
    type 'a alg_list = Empty | Cell of 'a * 'a alg_list

    // Returns a new empty list.
    let empty = Empty

    // Adds an element at the front of a list.
    let addHead elem lst = Cell (elem, lst)

    // Concatenates a list with another list.
    let rec append lst1 lst2 = 
        match lst1 with
        | Empty -> lst2
        | Cell(top,rest) -> Cell(top, (append rest lst2))
         
     // Returns a new list with the elements of the given list in reverse order.
    let rev lst =
        let rec rev_helper lst lstRev =
            match lst with
            | Empty -> lstRev
            | Cell(top, rest) -> rev_helper rest (Cell(top, lstRev))
        rev_helper lst empty

    // Removes the first ocurrence of an element from a list.
    // Raises EmptyList exception if needed.
    let remove elem lst = 
        let rec remove_helper elem tmpList = function
            | Empty -> raise (EmptyList "List is Empty")
            | Cell(top, rest) when elem = top ->  append (rev tmpList) rest 
            | Cell(top, rest) -> remove_helper elem (Cell(top, tmpList)) rest 
        remove_helper elem empty lst
    
    // Returns the first element of the given list.
    // Raises EmptyList exception if needed.    
    let head = function
        | Empty -> raise (EmptyList "List is Empty")
        | Cell(top,_) -> top
    
    // Returns the list that remains after removing the head of the given list.
    // Raises EmptyList exception if needed.
    let tail = function
        | Empty -> raise (EmptyList "List is Empty")
        | Cell(_, rest) -> rest
    
    // Determines the number of elements in the list.
    let length lst = 
        let rec length_helper lst num =
            match lst with
            | Empty -> num
            | Cell(_, rest) -> length_helper rest (num + 1)
        length_helper lst 0
    
    // Determines whether a list is empty.
    let isEmpty = function
        | Empty -> true
        | _ -> false
    
    // Returns true if the element is a member of a list.
    let rec isMember elem = function
        | Empty -> false
        | Cell(top, rest) when top = elem -> true
        | Cell(_, rest) -> isMember elem rest
    
    // Iterates through a list using a visit function.
    let rec iter visit = function
        | Empty -> ()
        | Cell(top, rest) -> visit top
                             iter visit rest

    // Creates a list by calling a generator on each index.
    let init num gen =
        let rec init_helper acc num gen =
            match num with
            | 0 -> acc
            | _ -> init_helper (Cell(gen (num - 1), acc)) (num - 1) gen
        init_helper empty num gen
    
    // Applies a function to each element of a list, accumulating a result
    // based on an initial value.    
    let rec fold func acc = function 
        | Empty -> acc
        | Cell(top, rest) -> fold func (func acc top) rest
    
    // Applies a function to each element of a list, creating a new list.    
    let rec map fn = function
        | Empty -> empty
        | Cell(top, rest) -> Cell((fn top),(map fn rest))
        
    // Creates a new list with those elements of the original for which a 
    // predicate is satisfied.
    let rec filter pred = function
        | Empty -> empty
        | Cell(top, rest) -> if pred top then Cell(top, (filter pred rest))
                             else filter pred rest
         
    

