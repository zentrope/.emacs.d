;;-----------------------------------------------------------------------------
;; Theme
;;-----------------------------------------------------------------------------

(defun kfi-x-offset ()
  50
  ;;(/ (display-pixel-width) 4)
  )

;; (add-to-list 'initial-frame-alist `(top . 60))
;; (add-to-list 'initial-frame-alist `(left . ,(kfi-x-offset)))
;; (add-to-list 'initial-frame-alist `(width . 100))
;; (add-to-list 'initial-frame-alist
;;              (cons 'height (/ (- (display-pixel-height) 160)
;;                               (frame-char-height))))

(scroll-bar-mode 0)
(tool-bar-mode 0)

(when (not window-system)
  ;;
  ;; When running in the terminal, turn off the menu.
  ;;
  (global-hl-line-mode 0)
  (menu-bar-mode 0))

(fringe-mode '(1 . 1))
(column-number-mode 1)
(cua-mode 1)
(show-paren-mode t)
(custom-set-variables '(indent-tabs-mode nil))
(setq-default line-spacing 1)
(setq-default inhibit-startup-screen t)
(setq-default standard-indent 2)
(add-hook 'before-save-hook 'whitespace-cleanup)
;;(set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)
(set-face-attribute 'default nil :family "Menlo" :height 120 :weight 'normal)
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow)
(setq ring-bell-function 'ignore)

(when window-system
  (global-hl-line-mode 0)

  (invert-face 'default)

  (defun kfi-setup-default-theme-overrides ()
    ;;
    ;; Frame
    (set-face-attribute 'fringe nil :background "#262626")
    (set-face-attribute 'default nil :background "black")
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

  (set-face-attribute 'hl-line nil :foreground nil :underline nil)
  (set-face-foreground 'highlight nil)

  (defun kfi-setup-modeline-non-powerline ()
    (set-face-attribute 'region nil :foreground nil :background "blue")

    (set-face-attribute 'mode-line nil :foreground "dodgerblue" :background "#262626"
                        :family "Menlo" :height 100 :weight 'normal
                        :box '(:line-width 4 :color "#262626" :style nil))

    (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                        :background "#000000" :family "Menlo" :height 100
                        :weight 'normal :italic nil
                        :box '(:line-width 4 :color "#000000" :style nil)))


  (kfi-setup-modeline-non-powerline)

  ;;
  ;; Not sure if this works.
  (defun kfi-fix-echo-area ()
    (interactive)
    (with-current-buffer (get-buffer " *Echo Area 0*")
      (setq-local face-remapping-alist '((default :family "Monaco" :height 100)))))
  ;;

  (defun kfi-setup-powerline ()
    (powerline-default-theme)
    (set-face-attribute 'powerline-active1 nil :foreground "violet" :background "black")
    (set-face-attribute 'powerline-active2 nil :foreground "lime" :background "black")

    (set-face-attribute 'powerline-inactive1 nil :foreground "violet" :background "grey22")
    (set-face-attribute 'powerline-inactive2 nil :foreground "lime" :background "grey22")

    (set-face-attribute 'mode-line nil :height 100 :weight 'normal
                        :box '(:line-width 2 :color "black" :style nil)
                        :background "black" :foreground "palegreen")

    (set-face-attribute 'mode-line-inactive nil :height 100 :weight 'normal
                        :background "grey22"
                        :box '(:line-width 2 :color "grey22" :style nil))  )

  ;;(kfi-setup-powerline)
  ;;
  ;; Make minibuffer have a smaller font
  (add-hook 'minibuffer-setup-hook 'kfi-craft-minibuffer)

  (add-to-list 'default-frame-alist '(cursor-color . "orange"))

  (defun kfi-craft-minibuffer ()
    (set (make-local-variable 'face-remapping-alist)
         '((default :family "Monaco" :height 100))))

  )

(setq ns-use-srgb-colorspace t)

(provide 'kfi-theme)
