(use-package markdown-mode
  :ensure t
  :mode ("\\.markdown$" "\\.md$"
         "\\.mkd$"
         "\\.mkdn$"
         "\\.mdown$"
         "\\.mdwn$" "\\.text$")
  :config
  (defun kfi/markdown-mode-hook ()
    (auto-fill-mode 1))

  (add-hook 'markdown-mode-hook 'kfi/markdown-mode-hook))

(provide 'kfi-markdown)
