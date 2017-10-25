;;; kfi-html --- config
;;; Commentary:
;;; Code:

(add-hook 'html-mode-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))

(provide 'kfi-html)
;;; kfi-html.el ends here
