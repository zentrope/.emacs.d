(require 'jsx-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

(custom-set-variables
 '(jsx-indent-level 2))

(defun kfi-jsx-mode-init ()
  (when (require 'auto-complete nil t)
    (auto-complete-mode t)))

(add-hook 'jsx-mode-hook 'kfi-jsx-mode-init)

(provide 'kfi-jsx)
