;; config/erc.el

(defun kfi-erc-mode-hook ()
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil))

(add-hook 'erc-mode-hook 'kfi-erc-mode-hook)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(provide 'kfi-erc)
