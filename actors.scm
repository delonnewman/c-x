;; experimenting with building a object system based on Ruby and the Actor model

(define-syntax send
  (syntax-rules ()
    ((send object method args ...)
     (object (quote method) args ...))))

(define (object-forms . methods)
  `(lambda (method . args)
      ,(cons 'cond (map (lambda (pair) `((equal? (quote ,(car pair)) method) (begin ,@(cdr pair)))) methods))))

(define-syntax object
  (lambda (x)
    (syntax-case x ()
      [(_) #'nil]
      [(_ (method body ...) ...)
        ; TODO: there's no-doubt a way to do this properly
        #`(eval (object-forms (quote (method body ...)) ...))]
      )))

(define (includes? ls value)
  (cond
    [(equal? '() ls) false]
    [(equal? (car ls) value) true]
    [else (include? (cdr ls) value)]))

(define (Object super)
  (define methods (list 'to_s 'inspect 'methods))
  (lambda (method . args)
    (cond
      [(equal? method 'to_s) "#<Object>"]
      [(equal? method 'inspect) "#<Object>"]
      [(equal? method 'methods) methods]
      [(equal? method 'responds_to?) (includes? methods (car args))]
      [else
        (if (send super responds_to? method)
          (send super method)
          (error 'object "method missing"))])))

(define (Class superclass))

(define nil
  (lambda (method . args)
    (cond
      [(equal? method 'to_s) ""]
      [(equal? method 'inspect) "nil"]
      [(equal? method 'true?) false]
      [(equal? method 'false?) true]
      [(equal? method 'responds_to?) true]
      [else nil])))

(define true
  (lambda (method . args)
    (cond
      [(equal? method 'to_s) "true"]
      [(equal? method 'inspect) "true"]
      [(equal? method 'true?) true]
      [(equal? method 'false?) false]
      [else (error 'true "method missing")])))

(define false
  (lambda (method . args)
    (cond
      [(equal? method 'to_s) "false"]
      [(equal? method 'inspect) "false"]
      [(equal? method 'true?) false]
      [(equal? method 'false?) true]
      [else (error 'true "method missing")])))

;(define tester
; (object
;  `(test ,(lambda () 1))))

;(display (tester 'test))
