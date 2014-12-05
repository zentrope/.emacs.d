;; Playing around with a simple Clojure inferior-lisp.

(setq inferior-lisp-program (concat (getenv "HOME") "/bin/boot repl"))

(provide 'kfi-lisp)
