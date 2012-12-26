
(require 'clojurescript-mode)

(defun clojurescript-repl ()
 (interactive)
 (run-lisp "/Users/keith/Bin/lein trampoline cljsbuild repl-listen"))
