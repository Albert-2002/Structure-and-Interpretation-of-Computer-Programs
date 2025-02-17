#lang sicp

; Exercise 1.1
; Evaluate expressions

10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(- 4 6)


; Exercise 1.2
; Translate the following expression into prefix form

(define numerator (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))))
(define denominator (* 3 (- 6 2) (- 2 7)))
; numerator
; denominator
(/ numerator denominator)

; Exercise 1.3
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (sum-of-squares x y) (+ (* x x) (* y y)))

(define (sum-of-squares-of-two-larger x y z)
(cond ((and (<= x y) (<= x z)) (sum-of-squares y z))
        ((and (<= y x) (<= y z)) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(sum-of-squares-of-two-larger 1 2 3)


; Exercise 1.4
; Observe that our model of evaluation allows for combinations whose operators are compound expressions.
; Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

(a-plus-abs-b 1 -2)

; Exercise 1.5
; Ben Bitdiddle has invented a test to determine whether the interpreter he is
; faced with is using applicative-order evaluation or normal-order evaluation:

; infinite loop
(define (p) (p))

(define (test x y)
    (if (= x 0) 0 y))

; (test 0 (p)) is an infinite loop because the interpreter will evaluate the arguments before applying the procedure.
; This is because the interpreter uses applicative-order evaluation.