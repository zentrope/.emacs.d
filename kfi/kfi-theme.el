;;-----------------------------------------------------------------------------
;; Theme / Appearance related stuff.
;;-----------------------------------------------------------------------------

(delete-selection-mode 1)
(tool-bar-mode 0)
(setq scroll-step 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(if window-system
    (progn (scroll-bar-mode 0)
           (global-hl-line-mode 1)
           (fringe-mode '(6 . 6)))
  (progn (global-hl-line-mode 1)
         (set-face-background hl-line-face "gray13")
         (menu-bar-mode 0)))

(column-number-mode 1)
(cua-mode 1)
(show-paren-mode t)
(custom-set-variables '(indent-tabs-mode nil))
(setq-default line-spacing 1)
(setq-default inhibit-startup-screen t)
(setq-default standard-indent 2)
(setq-default tab-width 2)
(add-hook 'before-save-hook 'whitespace-cleanup)
;;(set-face-attribute 'default nil :family "Menlo" :height 120 :weight 'normal)
;;(set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal)
(set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow)
(setq ring-bell-function 'ignore)

(when window-system

  ;;
  ;; Not sure if this works.
  (defun kfi-fix-echo-area ()
    (interactive)
    (with-current-buffer (get-buffer " *Echo Area 0*")
      (setq-local face-remapping-alist '((default :family "Monaco" :height 100)))))

  ;; Make minibuffer have a smaller font
  (add-hook 'minibuffer-setup-hook 'kfi-craft-minibuffer)

  (defun kfi-craft-minibuffer ()
    (set (make-local-variable 'face-remapping-alist)
         '((default :family "Monaco" :height 100)))))

(setq ns-use-srgb-colorspace t)

(provide 'kfi-theme)
