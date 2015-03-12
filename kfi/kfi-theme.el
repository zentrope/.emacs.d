;;-----------------------------------------------------------------------------
;; Theme / Appearance related stuff.
;;-----------------------------------------------------------------------------

(scroll-bar-mode 0)
(tool-bar-mode 0)
(setq scroll-step 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(when (not window-system)
  ;;
  ;; When running in the terminal, turn off the menu.
  ;;
  (global-hl-line-mode 0)
  (menu-bar-mode 0))

(fringe-mode '(6 . 6))
(column-number-mode 1)
(cua-mode 1)
(show-paren-mode t)
(custom-set-variables '(indent-tabs-mode nil))
(setq-default line-spacing 0)
(setq-default inhibit-startup-screen t)
(setq-default standard-indent 2)
(setq-default tab-width 2)
(add-hook 'before-save-hook 'whitespace-cleanup)
;;(set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)
(set-face-attribute 'default nil :family "Menlo" :height 120 :weight 'normal)
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow)
(setq ring-bell-function 'ignore)

(setq dark-mode t)

(when (and window-system (not dark-mode))
  (global-hl-line-mode 1)

  (defun kfi-setup-modeline ()
    (set-face-attribute 'region nil :foreground nil :background "darkseagreen2")
    (set-face-attribute 'hl-line nil :foreground nil :background "lavender"
                        :underline nil)

    (set-face-attribute 'mode-line nil :foreground "royalblue" :background "#dddddd"
                        :family "Menlo" :height 100 :weight 'normal
                        :box '(:line-width 4 :color "#dddddd" :style nil))

    (set-face-attribute 'mode-line-inactive nil :foreground "#666666"
                        :background "#bbbbbb" :family "Menlo" :height 100
                        :weight 'normal :italic t
                        :box '(:line-width 4 :color "#bbbbbb" :style nil)))
  (kfi-setup-modeline)
  (add-to-list 'default-frame-alist '(cursor-color . "dodgerblue")))

(when (and window-system dark-mode)
  (global-hl-line-mode 1)

  (invert-face 'default)

  (defun kfi-setup-default-theme-overrides ()
    ;;
    ;; Frame
    (set-face-attribute 'fringe nil :background "#212021")
    (set-face-attribute 'default nil :background "#212021")
    ;;
    ;; Font-lock
    (set-face-attribute font-lock-keyword-face nil :foreground "peru")
    (set-face-attribute font-lock-preprocessor-face nil :foreground "steelblue")
    (set-face-attribute font-lock-function-name-face nil :foreground "cornflowerblue")
    (set-face-attribute font-lock-constant-face nil :slant 'italic :foreground "mediumslateblue")
    (set-face-attribute font-lock-string-face nil :slant 'normal :foreground "plum")
    (set-face-attribute font-lock-variable-name-face nil :foreground "sandybrown")
    (set-face-attribute font-lock-comment-face nil :slant 'normal :foreground "gray40"))

  (kfi-setup-default-theme-overrides)

  ;; (set-face-attribute 'hl-line nil :foreground nil :underline nil)
  ;; (set-face-foreground 'highlight nil)

  (set-face-attribute 'hl-line nil :foreground nil :background "gray15"
                      :underline nil)

  (defun kfi-setup-modeline ()
    (set-face-attribute 'region nil :foreground nil :background "blue")

    (set-face-attribute 'mode-line nil
                        :foreground "white"
                        :background "dodgerblue4"
                        :family "Monaco" :height 100 :weight 'normal
                        :box '(:line-width 2 :color "dodgerblue4" :style nil))

    (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                        :background "gray15" :family "Menlo" :height 100
                        :weight 'normal :italic nil
                        :box '(:line-width 2 :color "gray17" :style nil))
    ;;
    )

  (kfi-setup-modeline)

  (add-to-list 'default-frame-alist '(cursor-color . "dodgerblue")))

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
