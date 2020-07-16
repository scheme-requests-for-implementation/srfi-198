;; please see copyright notice in ./COPYING

(define-record-type Foreign-Interface-Error
    (make-foreign-interface-error-error error-set code scheme-procedure foreign-interface locales message data)
    foreign-error?
  (error-set foreign-error:error-set)
  (code foreign-error:code)
  (scheme-procedure foreign-error:scheme-procedure)
  (foreign-interface foreign-error:foreign-interface)
  (locales foreign-error:locales)
  (message foreign-error:message)
  (data foreign-error:data))

(define (make-foreign-error the-alist)
  #f
  )

(define (raise-foreign-error the-alist . o)
  (let-optionals o ((continuable #f))
    (if continuable
        (raise-continuable (make-foreign-error the-alist))
        (raise (make-foreign-error the-alist)))))

