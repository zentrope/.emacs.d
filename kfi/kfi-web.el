;;; kfi-web --- config
;;; Commentary:
;;; Code:

(defvar web-mode-markup-indent-offset)
(defvar web-mode-css-indent-offset)
(defvar web-mode-code-indent-offset)
(defvar web-mode-indent-style)
(defvar web-mode-content-types)
(defvar web-mode-content-types)
(defvar js-indent-level)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(with-eval-after-load 'web-mode
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-content-types (cons '("jsx" . "\\.js\\'") web-mode-content-types))
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "cornflowerblue")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "goldenrod"))

(defun kfi/css-mode-hook ()
  "Set preferences when 'css-mode' is invoked."
  (company-mode 1)
  ;; (set (make-local-variable 'company-backends) '(company-css))
  ;; (turn-on-css-eldoc)
  (local-set-key (kbd "TAB") 'company-complete)
  (local-set-key (kbd "RET") 'newline-and-indent))

(defun kfi/js-mode-hook ()
  "Set preferences when 'js-mode' is invoked."
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2)
  (local-set-key (kbd "RET") 'newline-and-indent))

(with-eval-after-load 'css-mode
  (add-hook 'css-mode-hook #'kfi/css-mode-hook))

(with-eval-after-load 'json-mode
  (add-hook 'json-mode-hook #'kfi/js-mode-hook))

(with-eval-after-load 'js-mode
  (add-hook 'js-mode-hook #'kfi/js-mode-hook))

(provide 'kfi-web)
;;; kfi-web.el ends here
