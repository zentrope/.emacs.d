(use-package paren-face
  :ensure t
  :config
  (global-paren-face-mode 1))

(use-package clojure-mode-extra-font-locking
  :ensure t)

(use-package clojure-mode
  :ensure t
  :config
  (setq clojure-defun-style-default-indent nil)

  ;; (defconst kfi-clj-anonfn
  ;;   `(("\\(#\\)("
  ;;      (0 (progn (compose-region (match-beginning 1)
  ;;                                (match-end 1) "9")
  ;;                nil)))))

  ;; (font-lock-add-keywords 'clojure-mode       kfi-clj-anonfn)
  ;; (font-lock-add-keywords 'clojurescript-mode kfi-clj-anonfn)
  (add-hook 'clojure-mode-hook 'prettify-symbols-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'cider-mode))

(use-package cider
  :ensure t
  :config
  (setq cider-font-lock-dynamically '(macro core function var))
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-overlays-use-font-lock t)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook 'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (setq cider-repl-use-pretty-printing 1)
  (setq cider-cljs-lein-repl
        (concat "(do (require 'user) "
                "    (user/start-cljs)"
                "    (user/repl-cljs))")))

(provide 'kfi-clojure)
