
RM ?=rm
LS ?=ls
SBCL ?=sbcl

LISP_IMPL ?=sbcl

.PHONY: build-sbcl-exe rebuild-exe clean help


.PHONY: help
help: ## Show this help
	@grep -E -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'



rebuild-exe: clean build-$(LISP_IMPL)-exe  ## clean & rebuild


build-sbcl-exe: ## build exe using sbcl
	$(SBCL) --eval "(progn (require :asdf) (require :quicklisp))" \
--eval '(setf asdf:*asdf-verbose* t *load-verbose* t *load-print* t *compile-verbose* t *compile-print* t)' \
--eval "(declaim #+sbcl(sb-ext:unmuffle-conditions style-warning))" \
--eval "(declaim #+sbcl(sb-ext:unmuffle-conditions compiler-note))" \
--eval "(progn (ql:quickload :dmfd) (asdf:make :dmfd))" \
--quit
	$(LS) -lh dmfd



clean: ## remove built exe
	$(RM) dmfd

