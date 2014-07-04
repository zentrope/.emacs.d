(require 'org)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-html-doctype "html5")
(setq org-export-with-smart-quotes t)
(setq org-replace-disputed-keys t)

(provide 'kfi-org)
