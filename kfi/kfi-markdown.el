(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mkd$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mkdn$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdwn$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))

(setq markdown-xhtml-header-content
      "<style>body { margin: 0 auto; width: 600px;} </style>")

(defun kfi-markdown-mode-hook ()
  (auto-fill-mode 1))

(add-hook 'markdown-mode-hook 'kfi-markdown-mode-hook)

(provide 'kfi-markdown)