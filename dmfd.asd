(asdf:defsystem #:dmfd
  :description "Describe here"
  :author "jonghyouk yun <ageldama@gmail.com>"
  :license  "UNLICENSED"
  :version "0.0.1"

  ;; :around-compile (lambda (next)
  ;;                   (proclaim '(optimize (debug 3)
  ;;                               (safety 3)
  ;;                               (speed 3)
  ;;                               (compilation-speed 0)))
  ;;                   (funcall next))

  :depends-on ()

  :serial t
  :components ((:file "src"))

  :build-operation "asdf:program-op"
  :build-pathname "dmfd"
  :entry-point "dmfd:main"
  )
