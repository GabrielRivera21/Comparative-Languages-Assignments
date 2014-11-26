(*
 * queue.fs
 * @author Gabriel Rivera Per-ossenkopp
 * November 19, 2014
 * Description: This is the implementation (source) file of the data structure Queue.
 *)

// Indicates the namespace that contains the Queue module.
namespace FunctionalCollections

//Defines the EmptyQueue Exception
exception EmptyQueue of string

module Queue =
    // Declares the queue data type.
    type 'a queue = QueueList of 'a list * 'a list

     // Returns a new empty queue.
    let empty = QueueList ([], [])

    // Determines whether a queue is empty.
    let isEmpty = function
        | QueueList ([], []) -> true
        | _ -> false
    
    // Adds an element to the front of a queue.
    let add elem (QueueList (remElems, addElems)) = QueueList (remElems, elem::addElems)

    //A helper method to fill the list containing the elements to remove
    //from the list that adds elements
    //Note: It is only called when the remove elements list is empty.
    let rec fillRemList (QueueList (remElems, addElems)) = 
        match remElems, addElems with
        | lst, [] -> QueueList (lst, [])
        | rem, hd::add -> fillRemList (QueueList (hd::rem, add))
    
    // Removes the element at the front of a queue.
    // Raises EmptyQueue exception if needed.   
    let rec remove = function
        | QueueList ([], []) -> raise (EmptyQueue "Queue is Empty")
        | QueueList ([], elems) -> remove (fillRemList (QueueList ([], elems)))
        | QueueList (_::rest, elems) -> QueueList (rest, elems)
    
    // Returns the element at the top of a queue.
    // Raises EmptyQueue exception if needed.
    let rec peek = function
        | QueueList ([], []) -> raise (EmptyQueue "Queue is Empty")
        | QueueList ([], elems) -> peek (fillRemList (QueueList ([], elems)))
        | QueueList (hd::_, _) -> hd
        
    
    // Iterates through a queue using a visit function.
    let rec iter visit = function
        | QueueList ([], []) -> ()
        | QueueList ([], elems) -> iter visit (fillRemList (QueueList ([], elems)))
        | QueueList (hd::rest, elems) -> visit hd
                                         iter visit (QueueList (rest, elems))
        

        
        
        
        

    
    

