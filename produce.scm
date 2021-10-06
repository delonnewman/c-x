(define (p value)
  (display value)
  (newline)
  value)

(define (ptag tag value)
  (display tag)
  (p value))

(define (map f lst)
  (if (null? lst)
      lst
      (cons (f (car lst)) (map f (cdr lst)))))

(assert (equal? '(2 3 4 5) (map add1 '(1 2 3 4))))

(define (reduce f lst . init)
  (let ((first (if (null? init) (car lst) (car init))))
    (if (null? lst)
        first
        (let* ((rest (if (null? init) (cdr lst) lst))
               (memo (f first (car rest))))
          (reduce f (cdr rest) memo)))))

(assert (equal? (+ 1 2 3 4) (reduce + '(1 2 3 4))))

(define (produce f lst . init)
  (let ((first (if (null? init) (car lst) (car init))))
    (if (null? lst)
        (list first)
        (let* ((rest (if (null? init) (cdr lst) lst))
               (memo (f first (car rest))))
          (cons first (produce f (cdr rest) memo))))))

(assert (equal? '(1 3 6 10) (produce + '(1 2 3 4))))
