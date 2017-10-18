(eval-after-load 'go-mode
  '(progn (add-hook 'before-save-hook 'gofmt-before-save)
          (setq gofmt-command "goimports")
          (add-hook 'go-mode-hook 'flycheck-mode)))

(provide 'kfi-golang)
