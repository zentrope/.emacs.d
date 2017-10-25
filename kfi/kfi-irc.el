;;; kfi-irc --- config
;;; Commentary:
;;; Code:

(defvar erc-modules)
(defvar erc-hide-list)
(defvar erc-fill-prefic)
(defvar erc-prompt)
(defvar erc-fill-prefix)
(defvar erc-fill-column)
(defvar erc-scroll-to-bottom)
(defvar erc-max-buffer-size)
(defvar erc-truncate-buffer-on-save)
(defvar erc-insert-post-hook)

(declare-function erc-scrolltobottom-mode "erc-goodies.el")
(declare-function erc-update-modules "erc.el")

(with-eval-after-load 'erc
  (defun kfi/erc-mode-hook ()
     (make-local-variable 'global-hl-line-mode)
     (setq global-hl-line-mode nil))

  (add-hook 'erc-mode-hook 'kfi/erc-mode-hook)

  ;; Not sure if this is necessary.
  (progn (add-to-list 'erc-modules 'truncate)
         (add-to-list 'erc-modules 'scrolltobottom)
         (erc-update-modules))

  (erc-scrolltobottom-mode 1)

  (setq erc-hide-list '("JOIN" "PART" "QUIT"))
  (setq erc-fill-prefix "    ")
  (setq erc-prompt (lambda () (concat "\n" (buffer-name) " >")))

  (setq erc-fill-column 79)
  (setq erc-scroll-to-bottom -2)
  (setq erc-truncate-buffer-on-save t)
  (setq erc-max-buffer-size 30000)

  (add-hook 'erc-insert-post-hook
            'erc-truncate-buffer)
  (setq erc-truncate-buffer-on-save t))

(provide 'kfi-irc)
;;; kfi-irc.el ends here
