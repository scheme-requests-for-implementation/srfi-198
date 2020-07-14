;; please see copyright notice in 198/COPYING

(define-library (srfi 198)
  (export

   ;; 3.1  Errors

#| useful for debuging

   errno/E2BIG errno/EACCES errno/EADDRINUSE errno/EADDRNOTAVAIL
   errno/EAFNOSUPPORT errno/EAGAIN errno/EALREADY errno/EBADF
   errno/EBADMSG errno/EBUSY errno/ECANCELED errno/ECHILD
   errno/ECONNABORTED errno/ECONNREFUSED errno/ECONNRESET
   errno/EDEADLK errno/EDESTADDRREQ errno/EDOM errno/EDQUOT
   errno/EEXIST errno/EFAULT errno/EFBIG errno/EHOSTUNREACH
   errno/EIDRM errno/EILSEQ errno/EINPROGRESS errno/EINTR errno/EINVAL
   errno/EIO errno/EISCONN errno/EISDIR errno/ELOOP errno/EMFILE
   errno/EMLINK errno/EMSGSIZE errno/ENAMETOOLONG errno/ENETDOWN
   errno/ENETRESET errno/ENETUNREACH errno/ENFILE errno/ENOBUFS
   errno/ENODEV errno/ENOENT errno/ENOEXEC errno/ENOLCK errno/ENOMEM
   errno/ENOMSG errno/ENOPROTOOPT errno/ENOSPC errno/ENOSYS
   errno/ENOTCONN errno/ENOTDIR errno/ENOTEMPTY errno/ENOTRECOVERABLE
   errno/ENOTSOCK errno/ENOTSUP errno/ENOTTY errno/ENXIO
   errno/EOPNOTSUPP errno/EOVERFLOW errno/EOWNERDEAD errno/EPERM
   errno/EPIPE errno/EPROTO errno/EPROTONOSUPPORT errno/EPROTOTYPE
   errno/ERANGE errno/EROFS errno/ESPIPE errno/ESRCH errno/ESTALE
   errno/ETIMEDOUT errno/ETXTBSY errno/EWOULDBLOCK errno/EXDEV
|#

   make-syscall-error syscall-error?
   syscall-error:errno syscall-error:message
   syscall-error:procedure-name syscall-error:syscall-name
   syscall-error:data
   errno-error
   errno-string errno-name
   )

  (cond-expand ((not openbsd)
    (export

#|
     ;; 3.1  Errors

     errno/EMULTIHOP errno/ENOLINK
     ;; STREAMS:
     errno/ENODATA errno/ENOSTR errno/ENOSR errno/ETIME
|#
    )))

  (import
   (scheme base)

   (only (srfi 69) make-hash-table hash-table-set! hash-table-ref)
   (srfi 198 common)
   )

  (include-shared "198/198")
  (include "198/198.scm")
  )
