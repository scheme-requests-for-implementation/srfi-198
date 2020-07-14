;; please see copyright notice in ./COPYING

;; Common code that's used by both 198.sld and test.sld

(define-library (srfi 198 common)
  (export make-srfi-198-error srfi-198-error?
          srfi-198-error:message
          srfi-198-error:procedure-name
          srfi-198-error:data
          srfi-198-error)
  (import (scheme base)
          (chibi)
          )
  (begin

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
    ))
