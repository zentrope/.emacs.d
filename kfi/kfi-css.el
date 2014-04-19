(require 'css-mode)

(setq css-indent-offset 2)

(add-hook 'css-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(provide 'kfi-css)
