(require 'clojure-mode)

(defface kfi-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'faces)

(font-lock-add-keywords 'clojure-mode
                        '(("(\\|)" . 'kfi-paren-face)))

(font-lock-add-keywords 'clojure-mode
                        '(("defpartial\\|defpage" . font-lock-keyword-face)))


(put-clojure-indent 'defpartial 'defun)
(put-clojure-indent 'defpage 'defun)
(put-clojure-indent 'cond 'defun)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(defun kfi-clojure-hook ()
  (autopair-mode -1)
  (paredit-mode 1)
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'clojure-mode-hook #'kfi-clojure-hook)
