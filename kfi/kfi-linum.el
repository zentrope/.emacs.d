(require 'linum)


(set-face-attribute 'linum nil :foreground "#4a525a")
(setq linum-format "%4d \u2502 ")

(dolist (hook '(clojure-mode-hook
                js-mode-hook
                emacs-lisp-mode-hook
                scala-mode-hook))
  (add-hook hook (lambda () (linum-mode t))))

(provide 'kfi-linum)
