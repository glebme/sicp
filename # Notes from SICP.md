# Notes from SICP

## L1: Overview and Introduction Lisp

### Part 1

---

* The real problems come when we try to build very large systems.
* The only reason that we can design and understand large programs is because there are **techniques for controlling the complexity** of these large systems.
* In some sense, that is what this course is about and what computer science is about.
* The constraints imposed in building large software systems are the limitations of our own minds.
* Procedures are going to be our ways of talking about imperative knowledge
  * to be able to talk about other kinds of knowledge

#### Techniques

* Black-box abstraction - first major topic - 1. to suppress details, 2. expressing generality
  * Primitive Objects
    * Primitive procedures
    * Primitive data
  * Means of combination
    * Procedure composition
    * Construction of compound data
  * Means of abstraction
    * Procedure definition
    * Simple data abstractions
  * Capturing common patterns
    * High order procedures
    * Data as procedures
* Conventional interfaces - second major topic - knowledge of the kinds of various things that you can add and the ways of adding them
  * Generic operations
  * Large scale structure and modularity
  * Object oriented programming
  * Operations on aggregates (streams)
* Metalinguistic abstraction - third major topic - abstracting by talking about how you construct new languages
  * Interpretation apply-eval
  * Example - logic programming
  * Register machines

---

### Part 2

* A general framework for thinking about languages
  * What are the primitive elements? - what does the language come with?
  * What are the means of combination? - how do i put those primitive elements together?
  * What are the means of abstractions? - How do we draw those black boxes around them?
* Elements of Lisp
  * Operand
  * Operator
  * Combination
    * To evaluate a combination, do the following:
      1. Evaluate the sub-expressions of the combination
      2. Apply the procedure that is the value of the leftmost sub-expression to the arguments that are the values of the other sub-expressions(the operands)
  * Prefix notation
  * Creates a tree structure
  * Abstractions in lisp by using `define` - sounds like variables
  * `lambda` -> make a procedure (function)
    `(define (<name> <formal parameters>) <body>)`

``` lisp
      (define (abs x)
        cond ((> x 0) x)
             ((= x 0) 0)
             ((< x 0) (- x)))
```

---

### Part 3

* Substitution Model for Procedure Application
  * To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding arguments
    * The purpose of the substitution is to help us think about procedure application, not to provide a description of how the interpreter really works.
    * The use of procedures with "mutable data", the substitution model breaks down and must be replaced by a more complicated model of procedure application.

*Applicative order evaluation* -> evaluate then apply (wha tLisp uses)

``` scheme
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (f a) (sum-of-squares (+ a 1) (* a 2)))
(f 5)
= (sum-of-squares (+ 5 1) (* 5 2))
= (+ (square 6) (square 10))
= (+ (* 6 6) (* 10 10))
= (+ 36 100)
=  136
```

*Normal order evaluation* -> apply then evaluate

``` scheme
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (f a) (sum-of-squares (+ a 1) (* a 2)))
(f 5)
= (sum-of-squares (+ 5 1) (* 5 2))
= (+ (square (+ 5 1)) (square (* 5 2)))
= (+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
= (+ (* 6 6) (* 10 10))
= (+ 36 100)
=  136
```

* Using either evaluation for substitution model that yield legitimate values, should result in the same value (1.5 for an *illegitimate value*)

Exercise 1.3
Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers
```
