% Nate Loken
% CS-471 Programming Languages

/*
 * Problem 1:
 * 	listLen finds the length of a given list.
 * 	The first rule states that if the list is empty then then X must be 0 and the second 
 * 	rule states that while there are still entries in the list add 1 to X and remove the 
 * 	first element from the list. This will create tail-recursion where starting at 0 it
 * 	will retroactively add 1 until the loop is complete.
 */
listLen(X, []) :- X is 0.
listLen(X+1, [_|T]) :-  listLen(X, T).

/*
 * Problem 2:
 * 	dropK removes the kth entries in a given list.
 * 	the first rule states that if K is 1 then X must be the tail of the list skipping the current entry,
 *  then the second rule states that if K isn't 1 then recurse through the list, where X and the list
 * 	start at the same point.
 */
dropK(X, [_|X], 1).
dropK([H|T2],[H|T],K) :- K1 is K-1,dropK(T2, T, K1).

/*
 * Problem 3:
 * 	divide divides a list at by the given  size K.
 *  The rule states that if X and Y are appended they will be equal to L and that X is of length K
 */
divide(X,Y,L,K) :- append(X,Y,L), length(X,K).

/*
 * Problem 4:
 * 	createListRange creates a list starting with X and ending with Y.
 * 	The first rule states that if X and Y are the same that the list must contain Y.
 * 	the second rule states that the list starts with X, then adds 1 to X, then recursively
 * 	adds the values of X to the list until X is equal to Y.
 */
createListRange([Y],Y,Y).
createListRange([X|T],X,Y) :- X1 is X+1, createListRange(T,X1,Y).