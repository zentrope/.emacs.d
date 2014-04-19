(require 'org)

(defun kfi-org-mode-hook ()
  (auto-fill-mode 1))

(add-hook 'org-mode-hook #'kfi-org-mode-hook)

(setq org-html-doctype "html5")
(setq org-export-with-smart-quotes t)

(provide 'kfi-org)
