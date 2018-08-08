(define (find s predicate)
	(cond 
		((null? s)
			#f)
		((predicate (car s))
			(car s))
		(else 
			(find (cdr-stream s) predicate)))
)

(define (scale-stream s k)
  (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k))
)

(define (has-cycle s)
	(define (eqs? x)
		(lambda (k) (eq? k x)))
	(define (helper q previous_streams)
		(cond
			((null? q)
				#f)
			((not (null? (filter (eqs? q) previous_streams)))
				#t)
			(else
				(helper (cdr-stream q) (cons q previous_streams)))))
	(helper (cdr-stream s) (list s))
)
(define (has-cycle-constant s)
  (define (eqs? x)
		(lambda (k) (eq? k x)))
	(define (helper q previous_streams)
		(cond
			((null? q)
				#f)
			((not (null? (filter (eqs? q) previous_streams)))
				#t)
			(else
				(helper (cdr-stream q) (cons q previous_streams)))))
	(helper (cdr-stream s) (list s))
)
