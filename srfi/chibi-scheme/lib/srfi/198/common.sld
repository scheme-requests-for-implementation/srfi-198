;; please see copyright notice in ./COPYING

;; Common code that's included by both 198.sld and test.sld

(define-record-type SRFI-198-Error
    (make-srfi-198-error message procedure-name data)
    srfi-198-error?
  (message srfi-198-error:message)
  (procedure-name srfi-198-error:procedure-name)
  (data srfi-198-error:data))

(define (srfi-198-error message procedure-name . data)
  (raise (make-srfi-198-error
           (string-append (symbol->string procedure-name) ": " message)
           procedure-name
           data)))
