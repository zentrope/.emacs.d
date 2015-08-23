(require 'clojure-mode)

(require 'clj-refactor)

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(defface kfi-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'faces)

(font-lock-add-keywords 'clojure-mode
                        '(("(\\|)" . 'kfi-paren-face)))

;;(setq clojure-defun-style-default-indent t)

(define-clojure-indent
  (cond 'defun)
  (cond-> 'defun)
  (GET 'defun)
  (PUT 'defun)
  (DELETE 'defun)
  (POST 'defun)
  (OPTIONS 'defun)
  (ANY 'defun))

(defun kfi-clojure-hook ()
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'kfi-clojure-hook)
(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'kfi-clojure)
