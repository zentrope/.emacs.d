(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets/")
                               yas-installed-snippets-dir))
  (yas-global-mode 1))

(provide 'kfi-snippets)
