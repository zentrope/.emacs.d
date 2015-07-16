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
(setq-default line-spacing 1)
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

;; Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(95 95))
;; (add-to-list 'default-frame-alist '(alpha 95 95))

(when (and window-system (not dark-mode))
  (global-hl-line-mode 1)
  (set-face-attribute 'fringe nil :background "white")
  (set-face-attribute 'default nil :background "white")
  (set-face-attribute 'default nil :family "Menlo" :height 120 :weight 'normal)

  (defun kfi-setup-modeline ()
    (set-face-attribute 'region nil :foreground nil :background "lavender")
    (set-face-attribute 'hl-line nil :foreground nil :background "aliceblue"
                        :underline nil)

    (set-face-attribute 'mode-line nil :foreground "royalblue" :background "#dddddd"
                        :family "Menlo" :height 100 :weight 'normal
                        :box '(:line-width 4 :color "#dddddd" :style nil))

    (set-face-attribute 'mode-line-inactive nil :foreground "#666666"
                        :background "#bbbbbb" :family "Menlo" :height 100
                        :weight 'normal :italic t
                        :box '(:line-width 4 :color "#bbbbbb" :style nil)))
  (kfi-setup-modeline)
  (add-to-list 'default-frame-alist '(cursor-color . "dodgerblue"))

  (defun kfi-setup-light-theme-overrides ()
    ;;
    ;; Frame
    ;; (set-face-attribute 'fringe nil :background "white")
    ;; (set-face-attribute 'default nil :background "white")
    ;;
    ;; Font-lock (mainly Clojure)
    (set-face-attribute font-lock-keyword-face nil :foreground "#a61d5d" :weight 'normal)
    ;; Java interop
    (set-face-attribute font-lock-preprocessor-face nil :foreground "sienna")
    (set-face-attribute font-lock-function-name-face nil :foreground "black")
    (set-face-attribute font-lock-variable-name-face nil :foreground "dodgerblue")
    (set-face-attribute font-lock-constant-face nil :foreground "#0086b3")
    (set-face-attribute font-lock-string-face nil :slant 'normal :foreground "#13208e")
    (set-face-attribute font-lock-comment-face nil :slant 'italic
                        :foreground "gray75" :height 120)
    (set-face-attribute font-lock-type-face nil :foreground "#795da3"))

  (kfi-setup-light-theme-overrides)
  ;;
  )


(when (and window-system dark-mode)
  (global-hl-line-mode 1)

  (invert-face 'default)

  (defun kfi-setup-default-theme-overrides ()
    ;;
    ;; Frame
    ;; (set-face-attribute 'fringe nil :background "#212021")
    ;; (set-face-attribute 'default nil :background "#212021")
    (set-face-attribute 'fringe nil :background "black")
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
