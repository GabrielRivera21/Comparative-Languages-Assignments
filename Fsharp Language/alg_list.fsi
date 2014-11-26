(*
 * alg_list.fsi
 * Signature file for a generic list.
 * This file contains the public interface of the list.
 * NOTE: The signature file MUST appear before the corresponding implementation
 *       source file in the Solution Explorer.
 *)

// Indicates the namespace that contains the AlgebraicList module.
namespace FunctionalCollections

// Defines the EmptyList exception.
exception EmptyList of string

// Declares the AlgebraicList module.
module AlgebraicList =
    // Declares the alg_list algebraic data type.
    type 'a alg_list = Empty | Cell of 'a * 'a alg_list

    // Returns a new empty list.
    val empty : 'a alg_list

    // Adds an element at the front of a list.
    val addHead : 'a -> 'a alg_list -> 'a alg_list

    // Removes the first ocurrence of an element from a list.
    // Raises EmptyList exception if needed.
    val remove : 'a -> 'a alg_list -> 'a alg_list when 'a : equality

    // Returns the first element of the given list.
    // Raises EmptyList exception if needed.
    val head : 'a alg_list -> 'a

    // Returns the list that remains after removing the head of the given list.
    // Raises EmptyList exception if needed.
    val tail : 'a alg_list -> 'a alg_list

    // Determines the number of elements in the list.
    val length : 'a alg_list -> int

    // Determines whether a list is empty.
    val isEmpty : 'a alg_list -> bool

    // Returns true if the element is a member of a list.
    val isMember : 'a -> 'a alg_list -> bool when 'a : equality

    // Concatenates a list with another list.
    val append : 'a alg_list -> 'a alg_list -> 'a alg_list

    // Returns a new list with the elements of the given list in reverse order.
    val rev : 'a alg_list -> 'a alg_list

    // Iterates through a list using a visit function.
    val iter : ('a -> unit) -> 'a alg_list -> unit

    // Creates a list by calling a generator on each index.
    val init : int -> (int -> 'a) -> 'a alg_list

    // Applies a function to each element of a list, accumulating a result
    // based on an initial value.
    val fold : ('a -> 'b -> 'a) -> 'a -> 'b alg_list -> 'a

    // Applies a function to each element of a list, creating a new list.
    val map : ('a -> 'b) -> 'a alg_list -> 'b alg_list

    // Creates a new list with those elements of the original for which a 
    // predicate is satisfied.
    val filter : ('a -> bool) -> 'a alg_list -> 'a alg_list
