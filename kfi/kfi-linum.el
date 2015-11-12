(require 'linum)

(set-face-attribute 'linum nil :foreground "#333")
(setq linum-format "%4d ")

;; (dolist (hook '(clojure-mode-hook
;;                 js-mode-hook
;;                 ;; emacs-lisp-mode-hook
;;                 scala-mode-hook))
;;   (add-hook hook (lambda () (linum-mode t))))

(provide 'kfi-linum)
