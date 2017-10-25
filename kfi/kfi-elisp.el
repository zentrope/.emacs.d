;;; kfi-elisp.el -- elisp config
;;; Commentary:
;;; Code:

(defun kfi/elisp-hook ()
  "Set up elisp prefs when invoked."
  (paredit-mode 1)
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook #'kfi/elisp-hook)

(provide 'kfi-elisp)
;;; kfi-elisp.el ends here
