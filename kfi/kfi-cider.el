(require 'cider)

;; https://github.com/clojure-emacs/cider

(setq cider-popup-stacktraces nil)
(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)

(provide 'kfi-cider)
