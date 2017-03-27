(use-package markdown-mode
  :ensure t
  :mode ("\\.markdown$" "\\.md$"
         "\\.mkd$"
         "\\.mkdn$"
         "\\.mdown$"
         "\\.mdwn$" "\\.text$")
  :config
  (defun kfi/markdown-mode-hook ()
    (set (make-local-variable 'global-hl-line-mode) nil)
    (auto-fill-mode 0)
    (visual-line-mode 1))

  (add-hook 'markdown-mode-hook 'kfi/markdown-mode-hook))

(provide 'kfi-markdown)
