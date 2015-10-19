;; config/erc.el

(require 'erc)

(defun kfi-erc-mode-hook ()
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil))

(add-hook 'erc-mode-hook 'kfi-erc-mode-hook)

;; Not sure if this is necessary.
(progn (add-to-list 'erc-modules 'truncate)
       (add-to-list 'erc-modules 'scrolltobottom)
       (erc-update-modules))

(erc-scrolltobottom-mode 1)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-fill-prefix "    ")
(setq erc-prompt (lambda () (concat "\n" (buffer-name) " >")))
(set-face-attribute 'erc-prompt-face nil
                    :foreground "darkorange" :background "black")
(set-face-attribute 'erc-timestamp-face nil
                    :foreground "gray25" :background "black")
(setq erc-fill-column 78)
(setq erc-scroll-to-bottom -2)
(setq erc-truncate-buffer-on-save t)
(setq erc-max-buffer-size 30000)

(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook
          'erc-truncate-buffer)
(setq erc-truncate-buffer-on-save t)

(provide 'kfi-erc)
