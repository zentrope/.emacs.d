;;; kfi-golang -- golang config
;;; commentary:
;;; code:

(defvar gofmt-command)

(with-eval-after-load 'go-mode
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook 'flycheck-mode))

(provide 'kfi-golang)
;;; kfi-golang.el ends here
