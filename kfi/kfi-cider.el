(require 'cider)

;; https://github.com/clojure-emacs/cider

(setq cider-popup-stacktraces nil)
(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'kfi-cider)
