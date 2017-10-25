;;; kfi-web --- config
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(with-eval-after-load 'web-mode
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-content-types
        (cons '("jsx" . "\\.js\\'") web-mode-content-types))
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "cornflowerblue")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "goldenrod"))

(with-eval-after-load 'css-mode
  (add-hook 'css-mode-hook '(lambda ()
                              (company-mode 1)
                              ;; (set (make-local-variable 'company-backends) '(company-css))
                              ;; (turn-on-css-eldoc)
                              (local-set-key (kbd "s-right") 'company-complete)
                              (local-set-key (kbd "RET") 'newline-and-indent))))

(defvar js-indent-level)

(with-eval-after-load 'js-mode
  (defun kfi-js-mode-hook ()
     (setq indent-tabs-mode nil)
     (setq js-indent-level 2)
     (local-set-key (kbd "RET") 'newline-and-indent))
  (add-hook 'js-mode-hook #'kfi-js-mode-hook))

(provide 'kfi-web)
;;; kfi-web.el ends here
