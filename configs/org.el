;; configs/org.el

(require 'org)

(defun kfi-org-mode-hook ()
  (auto-fill-mode 1))

(add-hook 'org-mode-hook #'kfi-org-mode-hook)
