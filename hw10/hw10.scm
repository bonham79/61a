(define (accumulate combiner start n term)
  (if (= n 0)
      start
	(combiner (term n) (accumulate combiner start (- n 1) term)))
  )


(define (accumulate-tail combiner start n term)
	(define (helper m value)
		(if (= n m)
			(combiner (term m) value)
		(helper (+ m 1) (combiner (term m) value))))
	(if (= 0 n)
		start
	(helper 1 start))		
)

(define-macro (list-of expr for var in seq if filter-fn)
	(if filter-fn
		(list 'map (list 'lambda (list var) expr) (list 'filter (list 'lambda (list var) filter-fn) seq))
	(list 'map (list 'lambda (list var) expr) seq))
)