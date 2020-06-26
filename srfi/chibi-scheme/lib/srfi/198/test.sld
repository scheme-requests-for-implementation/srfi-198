;; please see copyright notice in ./COPYING

(define-library (srfi 198 test)
  (export run-tests)

  (import (scheme base)
          (chibi)
          ;; (only (chibi process) exit)
          (chibi test)

          (srfi 198)
          )

  (include "198.so")
  (include "common.scm")

  (begin

    ;; Inverse of test-error, mutated from test-not, only errors if an
    ;; exception is raised

    (define-syntax test-not-error
      (syntax-rules ()
        ((_ expr) (test-assert (begin expr #t)))
        ((_ name expr) (test-assert name (begin expr #t)))))

    (define (run-tests)

      (test-group "srfi-198: POSIX system call exceptions"

#|
        (test-group "Prologue"

          (test 1 1)

          ) ;; end prologue
|#

        (test-group "Main tests"

          ;; Make sure the error raising code isn't malfunctioning and raising a different error
          (define the-error #f)

          ;; Lower numbered errnos haven't changed in decades....
          (test-error ((with-exception-handler
                        (lambda (exception) (if (syscall-error? exception) (set! the-error exception)))
                        (lambda () (errno-error 2 'proc-name 'sc-name 1 2 3 4)))))
          (test-assert (syscall-error? the-error))
          (test 2 (syscall-error:errno the-error))
          (test-assert (string? (syscall-error:message the-error)))
          (test 'proc-name (syscall-error:procedure-name the-error))
          (test 'sc-name (syscall-error:syscall-name the-error))
          (test '(1 2 3 4) (syscall-error:data the-error))

          (test-assert (string? (errno-string 2)))
          (test 'errno/ENOENT (errno-name 2))

          ) ;; end errors

#|
        (test-group "Epilogue"

          (test 1 1)

          ) ;; end epilogue
|#

        ))))
