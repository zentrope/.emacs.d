;; config/emacs-lisp.el

(defun kfi-elisp-hook ()
  (paredit-mode 1)
  (autopair-mode -1)
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'emacs-lisp-mode-hook #'kfi-elisp-hook)
