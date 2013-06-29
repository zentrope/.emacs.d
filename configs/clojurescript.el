(eval-after-load 'clojurescript-mode
  '(font-lock-add-keywords
    'clojurescript-mode `(("(\\(fn\\)[\[[:space:]]"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "λ")
                                     nil))))))

(eval-after-load 'clojurescript-mode
  '(font-lock-add-keywords
    'clojurescript-mode `(("\\(#\\)("
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "ƒ")
                                     nil))))))

(eval-after-load 'clojurescript-mode
  '(font-lock-add-keywords
    'clojurescript-mode `(("\\(#\\){"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "∈")
                                     nil))))))

(require 'clojurescript-mode)

(defun clojurescript-repl ()
  (interactive)
  (run-lisp "/Users/keith/Bin/lein trampoline cljsbuild repl-listen"))
