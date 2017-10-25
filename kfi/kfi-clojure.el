;;; kfi-clojure -- clojure
;;; Commentary:
;;; Code:

(require 'paren-face)
(global-paren-face-mode 1)

;; these are just here to silence free-variable warnings
(defvar clojure-indent-style)
(defvar cider-font-lock-dynamically)
(defvar cider-repl-use-clojure-font-lock)
(defvar cider-overlays-use-font-lock)
(defvar cider-repl-use-pretty-printing)

(with-eval-after-load 'clojure-mode
  (setq clojure-indent-style nil)
  (add-hook 'clojure-mode-hook 'prettify-symbols-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'cider-mode)
  (require 'cider))

(with-eval-after-load 'cider
  (setq cider-font-lock-dynamically '(macro core function var))
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-overlays-use-font-lock t)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook 'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (setq cider-repl-use-pretty-printing 1))

(provide 'kfi-clojure)
;;; kfi-clojure.el ends here
