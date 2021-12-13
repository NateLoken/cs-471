; Nate Loken
; 10/30/2021

#lang racket

; Problem 1
;   The powerfour function takes 1 parameter n which it then determines if n is a power of 4 by seeing if the square root of n is divisible by 4
;   or if the squareroot itself is 4
(define (powerfour n)
    (if (eq? (modulo (integer-sqrt n) 4) 0) #t (or (eq? n 4))))

(powerfour 4096)

; Problem 2
;   insert_at takes 3 parameters, a list, insertion position, and insertion data. Using that it sees if the list is empty, in which case it returns a null list, if it isn't
;   then the function checks if the position is 0 to determine if it is at the correct insertion position, if so then it appends the data to the list using cons.
;   if it isn't then the function appends the current data to the recursive call of the function with position and list variables decremented by 1.
(define (insert_at lst n item)
    (if (null? lst) 
        null (if (zero? n) 
            (cons item lst) (cons (car lst) (insert_at (cdr lst) (- n 1) item)))))

(define testList (list 1 2 3 4 6))

(insert_at testList 4 5)

; Problem 3
;   palindromep takes a single list parameter, and then determines if the list is a palindrome by checking the base case that the list is 1 element long indicating that the list is a 
;   palindrome. if the list isn't 1 element long then the function checks if the head is equal to the tail of the list and if it is then it removes those elements and recurses through
;   the list until either 2 elements aren't equivalent or there is only 1 element.
(define (palindromep lst)
    (cond
        [(null? (cdr lst)) 1]
        [(eq? (car lst) (car (reverse lst))) (palindromep (remq(car lst) (cdr lst)))]
        [else 0]))

(define testList2 (list 1 2 3 2 1))

(palindromep testList)
(palindromep testList2)

; Problem 4
;   isPrime takes two parameters, the integer to check, and the starting element. then it checks to see if n is less then or equal to 2 as if it 1 or less then it is a prime but if it
;   is equal to 2 then it isn't a prime. If it passes those checks then it sees if n is divisible by anything and if it is then it won't be prime. finally it checks to see if i squared
;   is greater than n to make sure no unnecessary checks are made as if i squared is larger than n then there is no other numbers n could be divisble by and is therefore prime.
(define (isPrime n i)
    (cond
        [(<= n 2) (if (eq? n 2) 0 1)]
        [(eq? (modulo n i) 0) 1]
        [(> (* i i) n) 0]
        [else (isPrime n (+ i 1))]))

(isPrime 17 2)
(isPrime 15 2)