(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports")
  (defun kfi-go-mode-hook ()
    (local-set-key (kbd "C-c C-r" 'go-remove-unused-imports))
    (local-set-key (kbd "C-c i" 'go-goto-imports)))
  (add-hook 'go-mode-hook #'kfi-go-mode-hook))

(provide 'kfi-golang)
