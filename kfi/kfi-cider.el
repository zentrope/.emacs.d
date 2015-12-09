(require 'cider)

;; https://github.com/clojure-emacs/cider

;;cider-stacktrace-default-filters

(setq cider-font-lock-dynamically '(macro core function var))
(setq cider-repl-use-clojure-font-lock t)

;;(setq cider-popup-stacktraces t)


(setq cider-overlays-use-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(add-hook 'clojure-mode-hook 'cider-mode)
(setq cider-repl-use-pretty-printing 1)

(provide 'kfi-cider)
