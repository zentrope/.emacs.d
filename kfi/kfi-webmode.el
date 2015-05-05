(require 'web-mode)

;; http://web-mode.org

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(defun kfi-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)

  (set-face-attribute 'web-mode-html-tag-face nil :foreground "cornflowerblue")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "goldenrod")
  ;; (set-face-attribute 'web-mode-html-attr-name-face  nil :foreground "")
  ;; (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "")
  ;; (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "")
  )

(add-hook 'web-mode-hook 'kfi-web-mode-hook)

(setq web-mode-content-types
      (cons '("jsx" . "\\.js\\'")
            web-mode-content-types))

(provide 'kfi-webmode)
