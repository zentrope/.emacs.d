(require 'js)

(defun kfi-js-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2)
  (local-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'js-mode-hook #'kfi-js-mode-hook)

(provide 'kfi-javascript)
