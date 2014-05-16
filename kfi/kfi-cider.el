(require 'cider)

;; https://github.com/clojure-emacs/cider

(setq cider-popup-stacktraces nil)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'kfi-cider)
