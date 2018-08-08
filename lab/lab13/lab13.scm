; Q1
(define (compose-all funcs)
	(cond
		((null? funcs)
			(lambda (x) x))
		
		(else
			(lambda (x)	((compose-all (cdr funcs))((car funcs)x))))))


; Q2
(define (tail-replicate x n)
  (define (helper k prev)
  	(if (= 0 k)
  		prev
  	(helper (- k 1) (cons x prev))))
  (helper n nil)
)