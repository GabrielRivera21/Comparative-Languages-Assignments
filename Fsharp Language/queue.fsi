(*
 * queue.fsi
 * By Antonio F. Huertas
 * Signature file for a generic queue.
 * This file contains the public interface of the queue.
 * NOTE: The signature file MUST appear before the corresponding implementation
 *       source file in the Solution Explorer.
 *)

// Indicates the namespace that contains the Queue module.
namespace FunctionalCollections

// Defines the EmptyQueue exception.
exception EmptyQueue of string

// Declares the Queue module.
module Queue =
    // Declares the queue data type.
    type 'a queue = QueueList of 'a list * 'a list

    // Returns a new empty queue.
    val empty : 'a queue

    // Determines whether a queue is empty.
    val isEmpty : 'a queue -> bool

    // Adds an element to the front of a queue.
    val add : 'a -> 'a queue -> 'a queue

    // Removes the element at the front of a queue.
    // Raises EmptyQueue exception if needed.
    val remove : 'a queue -> 'a queue

    // Returns the element at the top of a queue.
    // Raises EmptyQueue exception if needed.
    val peek : 'a queue -> 'a

    // Iterates through a queue using a visit function.
    val iter : ('a -> unit) -> 'a queue -> unit


