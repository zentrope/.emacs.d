(setq js-indent-level 2)

(defun kfi-js-mode-hook ()
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'js-mode-hook #'kfi-js-mode-hook)
