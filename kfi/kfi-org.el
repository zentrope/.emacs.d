(require 'org)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-html-doctype "html5")
(setq org-export-with-smart-quotes t)
(setq org-replace-disputed-keys t)

(setq org-html-head "<style>html { font-family: helvetica, sans-serif; }</style>")

(provide 'kfi-org)
