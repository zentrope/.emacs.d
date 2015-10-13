(require 'clojure-mode)

(defconst kfi-clj-lambda
  `(("(\\(fn\\)[\[[:space:]]"
     (0 (progn (compose-region (match-beginning 1)
                               (match-end 1) "λ")
               nil)))))

(defconst kfi-clj-anonfn
  `(("\\(#\\)("
     (0 (progn (compose-region (match-beginning 1)
                               (match-end 1) "ƒ")
               nil)))))

(defconst kfi-clj-settag
  `(("\\(#\\){"
     (0 (progn (compose-region (match-beginning 1)
                               (match-end 1) "∈")
               nil)))))

(font-lock-add-keywords 'clojure-mode       kfi-clj-lambda)
(font-lock-add-keywords 'clojure-mode       kfi-clj-anonfn)
(font-lock-add-keywords 'clojure-mode       kfi-clj-settag)
(font-lock-add-keywords 'clojurescript-mode kfi-clj-anonfn)
(font-lock-add-keywords 'clojurescript-mode kfi-clj-lambda)
(font-lock-add-keywords 'clojurescript-mode kfi-clj-settag)

(defface kfi-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'faces)

(defconst kfi-face '(("(\\|)" . 'kfi-paren-face)))

(font-lock-add-keywords 'clojure-mode kfi-face)
(font-lock-add-keywords 'clojurescript-mode kfi-face)

(defun kfi-cljs-indent ()
  (interactive)
  ;; Mainly for doing dom/html structures.
  (setq clojure-defun-style-default-indent t))

(defun kfi-clj-indent ()
  (interactive)
  (setq clojure-defun-style-default-indent nil))

(kfi-clj-indent)

(defun kfi-clojure-hook ()
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'clojure-mode-hook #'kfi-clojure-hook)
(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'kfi-clojure)
