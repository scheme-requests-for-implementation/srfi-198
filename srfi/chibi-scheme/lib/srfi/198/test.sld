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

        (test-group "Prologue"

          (test 1 1)

          ) ;; end prologue


        (test-group "~~~PLACEHOLDER"

          (test 1 1)

          ) ;; end errors


        (test-group "Epilogue"

          (test 1 1)

          ) ;; end epilogue

        ))))
