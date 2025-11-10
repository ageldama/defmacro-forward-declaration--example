(defpackage #:defmacro-forward-declaration
  (:nicknames #:dmfd)
  (:use #:cl)
  (:export :main))

(in-package #:defmacro-forward-declaration)

;; (proclaim '(optimize (debug 3)
;;             (safety 3)
;;             (speed 3)
;;             (compilation-speed 0)))

(defun main ()
  ;; (disassemble #'main)
  (with-foo-bar "hello" (a b)
                (format t "~a // ~a~%" a b)))


(defmacro with-foo-bar (base-str (foo-var bar-var) &rest body)
  `(let ((,foo-var (format nil "FOO:~a" ,base-str))
         (,bar-var (format nil "BAR:~a" ,base-str)))
     ,@body))


