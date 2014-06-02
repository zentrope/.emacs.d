;;-----------------------------------------------------------------------------
;; Theme
;;-----------------------------------------------------------------------------

(defun kfi-x-offset ()
  (/ (display-pixel-width) 4))

(add-to-list 'initial-frame-alist `(top . 60))
(add-to-list 'initial-frame-alist `(left . ,(kfi-x-offset)))
(add-to-list 'initial-frame-alist `(width . 100))
(add-to-list 'initial-frame-alist
             (cons 'height (/ (- (display-pixel-height) 260)
                              (frame-char-height))))

(scroll-bar-mode 0)
(tool-bar-mode 0)

(when (not window-system)
  ;;
  ;; When running in the terminal, turn off the menu.
  ;;
  (global-hl-line-mode 0)
  (menu-bar-mode 0))

(fringe-mode '(6 . 0))
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

  ;; (load-theme 'flatui t)
  ;; (load-theme 'ample t)
  ;; (load-theme 'wombat t)

  (set-face-attribute 'fringe nil :background "#262626")
  (set-face-attribute 'default nil :background "#262626")

  (set-face-attribute font-lock-keyword-face nil :foreground "peru")
  (set-face-attribute font-lock-preprocessor-face nil :foreground "steelblue")
  (set-face-attribute font-lock-function-name-face nil :foreground "dodgerblue")
  (set-face-attribute font-lock-constant-face nil
                      :slant 'italic :foreground "mediumslateblue")
  (set-face-attribute font-lock-string-face nil
                      :slant 'italic
                      :foreground "plum")

  ;; (set-face-attribute font-lock-string-face nil :slant 'italic :foreground "pink")
  (set-face-attribute font-lock-comment-face nil :slant 'italic :foreground "gray40")

  (set-face-attribute 'hl-line nil :foreground nil :underline nil)
  (set-face-foreground 'highlight nil)

  ;; (set-face-attribute 'region nil :foreground nil :background "blue")

  ;; (set-face-attribute 'mode-line nil :foreground "gray85" :background "#333355"
  ;;                     :family "Monaco" :height 100 :weight 'normal
  ;;                     :box '(:line-width 2 :color "#333355" :style nil))

  ;; (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
  ;;                     :background "#222233" :family "Monaco" :height 110
  ;;                     :weight 'normal :italic t
  ;;                     :box '(:line-width 2 :color "#222233" :style nil))


  ;;
  ;; Not sure if this works.
  (with-current-buffer (get-buffer " *Echo Area 0*")
    (setq-local face-remapping-alist '((default :family "Monaco" :height 100))))
  ;;
  (powerline-default-theme)
  (set-face-attribute 'mode-line nil :height 100 :weight 'normal)
  (set-face-attribute 'mode-line-inactive nil :height 100 :italic t :weight 'normal)
  ;;
  ;; Make minibuffer have a smaller font
  (add-hook 'minibuffer-setup-hook 'kfi-craft-minibuffer)

  (defun kfi-craft-minibuffer ()
    (set (make-local-variable 'face-remapping-alist)
         '((default :family "Monaco" :height 100))))
  ;;
  )

(set-cursor-color "orange")

(setq ns-use-srgb-colorspace t)

(provide 'kfi-theme)
