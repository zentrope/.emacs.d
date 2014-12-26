;; config/erc.el

(defun kfi-erc-mode-hook ()
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil))

(add-hook 'erc-mode-hook 'kfi-erc-mode-hook)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-fill-prefix "    ")
(setq erc-prompt (lambda () (concat "\n" (buffer-name) " > ")))
(set-face-attribute 'erc-prompt-face nil :foreground "darkorange" :background nil)
(set-face-attribute 'erc-timestamp-face nil :foreground "gray25" :background nil)
(setq erc-fill-column 78)
(provide 'kfi-erc)
