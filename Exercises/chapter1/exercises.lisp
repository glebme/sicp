; Exercise 1.3
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers
(define (<= a b) (or (< a b) (= a b)))
(define (square a) (* a a))
(define (sum-of-squares a b) (+ (square a) (square b)))
(define (f x y z) (
    cond ((or (and (<= x y) (<= y z)) (and (<= x z) (<= z y))) (sum-of-squares y z))
         ((or (and (<= y z) (<= z x)) (and (<= y x) (<= x z))) (sum-of-squares z x))
         ((or (and (<= z x) (<= x y)) (and (<= z y) (<= y x))) (sum-of-squares x y))
))
