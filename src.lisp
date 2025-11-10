(defpackage #:defmacro-forward-declaration
  (:nicknames #:dmfd)
  (:use #:cl)
  (:export :main))

(in-package #:defmacro-forward-declaration)


(defmacro with-foo-bar (base-str (foo-var bar-var) &rest body)
  `(let ((,foo-var (format nil "FOO:~a" ,base-str))
         (,bar-var (format nil "BAR:~a" ,base-str)))
     ,@body))


(defun main ()
  (disassemble #'main)
  (with-foo-bar "hello" (a b)
                (format t "~a // ~a~%" a b)))

