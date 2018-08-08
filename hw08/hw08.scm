(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
  (cond
	((< x 0)
		-1)
	((= x 0)
		0)
	((> x 0)
		1))
)

(define (square x) (* x x))

(define (pow b n)
  (cond 
	((= 1 n)
		b)
	((= 0 n)
		1)
	((= 2 n)
		(* b b))
	(else
		(if (even? n)
			(pow (pow b (/ n 2)) 2)
		(* b (pow (pow b (/ (- n 1) 2)) 2)))))
)

(define (ordered? s)
  (cond
	((null? s) 
		#t)
	((null?(cdr s))
		#t)
	(else
		(and (<= (car s) (car (cdr s))) (ordered? (cdr s))))) 
)

 (define (nodots s)
        (cond
                ((null? s)
                        nil)
                ((not(pair? s))
                        (cons s nil))
                ((not (pair? (car s)))
                        (cons (car s) (nodots (cdr s))))
				(else
					(cons (nodots (car s)) (nodots (cdr s))))))
		
	

			



; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond 
		((null? s)
			#f)
		((> (car s) v)
			#f)
		((= (car s) v)
			#t)
		(else
			(contains? (cdr s) v))))
          

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond 
		((null? s)
			(cons v s))
		((< v (car s))
			(cons v s))
		((= v (car s))
			s)
		(else 
			(append(list (car s)) (add (cdr s) v)))))
			
(define (intersect s t)
    (cond 
		((or (null? s) (null? t))
			nil)
		(else
			(define e1 (car s))
			(define e2 (car t))
			(cond
				((= e1 e2)
					(cons e1 (intersect (cdr s) (cdr t))))
				((< e1 e2)
					(intersect (cdr s) t))
				((> e1 e2)
					(intersect s (cdr t)))))))

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond 
		((null? s)
			t)
		((null? t)
			s)
		(else
			(define e1 (car s))
			(define e2 (car t))
			(cond
				((= e1 e2)
					(cons e1 (union (cdr s) (cdr t))))
				((< e1 e2)
					(cons e1 (union (cdr s) t)))
				((> e1 e2)
					(cons e2 (union s (cdr t))))))))