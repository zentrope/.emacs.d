;;-----------------------------------------------------------------------------
;; General stuff that makes looking at or using emacs a quantum easier.
;;-----------------------------------------------------------------------------

(defun kfi-x-offset ()
  (/ (display-pixel-width) 3))

(defun kfi-y-offset ()
  100
;;  (/ (display-pixel-height) 6)
  )

(add-to-list 'initial-frame-alist `(top . ,(kfi-y-offset)))
(add-to-list 'initial-frame-alist `(left . ,(kfi-x-offset)))

(scroll-bar-mode 0)
(tool-bar-mode 0)
(set-fringe-mode '(0.5 0.5))

(if (window-system)
    (progn
      (load-theme 'underwater t)
      (global-hl-line-mode 1)
      (set-face-underline 'hl-line nil)))

(column-number-mode 1)
(cua-mode 1)
(show-paren-mode t)

;; Seems to be the only way to force this globally.
(custom-set-variables '(indent-tabs-mode nil))

(setq-default line-spacing 0)
(setq-default inhibit-startup-screen t)

(setq-default standard-indent 2)

(add-hook 'before-save-hook 'whitespace-cleanup)

(set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)

(set-default 'blink-cursor-mode nil)
(set-default 'cursor-type '(hbar . 2))
(setq ring-bell-function 'ignore)

(setq speedbar-show-unknown-files 1)
