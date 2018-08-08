; Q4
(define (rle s)
  
  (define (count number stream total)
    (cond 
      ((null? stream) (cons-stream (list number total) nil))
      ((= number (car stream)) 
        (count number (cdr-stream stream) (+ 1 total)))
      (else
          (cons-stream (list number total) (rle stream)))))  

  (if (null? s) nil 
    (count (car s) (cdr-stream s) 1)))





; Q4 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q5
(define (insert n s)
  (define (helper first rest)
    (cond
      ((null? rest) (append first (list n))) 
      ((> n (car rest))
        (helper (append first (list(car rest))) (cdr rest)))
      (else
        (append (append first (list n)) rest))))
  (helper nil s)
)

; Q6
(define (deep-map fn s)
  (cond
    ((null? s) nil)
    ((atom? (car s))
      (cons (fn (car s)) (deep-map fn (cdr s))))
    (else
      (cons (deep-map fn (car s)) (deep-map fn (cdr s))))
    )
)

; Q7
; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

; Implementing and using these helper procedures is optional. You are allowed
; to delete them.
(define (unique s)
    (if (null? s) nil
      (cons (car s) (unique (filter (lambda (name) (not(eq? (car s) name))) (cdr s)))))
)

(define (count name s)
  (cond
    ((null? s) 0)
    ((eq? name (car s))
      (+ 1 (count name (cdr s))))
    (else
      (count name (cdr s))))
)

(define (tally names)
  (define namelst (unique names))
  (if (null? namelst) nil 
    (map 
      (lambda (name) (cons name (count name names))) namelst)))






