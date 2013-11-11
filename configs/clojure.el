(require 'clojure-mode)

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

(put-clojure-indent 'cond 'defun)

(define-clojure-indent
  (go-loop 1)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2))

(defun kfi-clojure-flash-region (start end)
  (let ((overlay (make-overlay start end)))
    (overlay-put overlay 'face 'secondary-selection)
    (run-with-timer 0.2 nil 'delete-overlay overlay)))

(defun kfi-clojure-flash-buffer ()
  (interactive)
  (save-excursion (kfi-clojure-flash-region (point-min) (point-max))))

(defun kfi-clojure-flash-defn ()
  (interactive)
  (save-excursion
    (end-of-defun)
    (let ((e (point)))
      (beginning-of-defun)
      (kfi-clojure-flash-region (point) e))))

(defun kfi-clojure-compile-buffer ()
  (interactive)
  (kfi-clojure-flash-buffer)
  (nrepl-eval-buffer))

(defun kfi-clojure-compile-defn ()
  (interactive)
  (kfi-clojure-flash-defn)
  (nrepl-eval-expression-at-point))

(defun kfi-clojure-hook ()
  (paredit-mode 1)
  (autopair-mode -1)
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "C-c C-c") 'kfi-clojure-compile-defn)
  (define-key nrepl-interaction-mode-map (kbd "C-c C-k")
    'kfi-clojure-compile-buffer)
  (local-set-key (kbd "C-c k") 'kfi-clojure-compile-buffer))

(add-hook 'clojure-mode-hook #'kfi-clojure-hook)
