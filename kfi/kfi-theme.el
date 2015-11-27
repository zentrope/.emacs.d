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
    (progn (global-hl-line-mode 0)
           (menu-bar-mode 0)))

(setq text-mode nil)

(when text-mode
  ;; Writing text in Markdown, say.
  (fringe-mode '(80 . 80))
  (setq-default line-spacing 5)
  (set-face-attribute 'default nil :family "monaco" :height 140 :weight 'normal)
  )

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
(set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow)
(setq ring-bell-function 'ignore)

(setq dark-mode t)
;;(setq dark-mode nil)

(when window-system
  (load-theme 'atom-one-dark t)

  ;; Adjustments to atom-one-dark theme
  (set-face-attribute 'fringe nil :background "#000000")
  (set-face-attribute 'default nil :background "#000000")
  (set-face-attribute font-lock-comment-face nil :slant 'italic)
  (set-face-attribute font-lock-function-name-face nil :foreground "#ABB2BF")
  (set-face-attribute font-lock-builtin-face nil :foreground "#71abec")
  (set-face-attribute font-lock-type-face nil :foreground "#71abec")

  (set-face-attribute 'magit-diff-removed nil :foreground "firebrick"
                      :background "black")

  (set-face-attribute 'magit-diff-added nil :foreground "green"
                      :background "black")

  (set-face-attribute 'magit-diff-added-highlight nil
                      :foreground "#98C379"
                      :background "black")

  (set-face-attribute 'magit-diff-removed-highlight nil
                      :foreground "indianred"
                      :background "black"))

;; Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(100 100))
;; (add-to-list 'default-frame-alist '(alpha 100 100))

;; (defun kfi-set-theme-mode ()
;;   (when (and window-system (not dark-mode))
;;     (global-hl-line-mode 1)
;;     (set-face-attribute 'fringe nil :background "white")
;;     (set-face-attribute 'default nil :background "white" :foreground "black")
;;     (set-face-attribute 'default nil :family "Menlo" :height 120 :weight 'normal)

;;     (defun kfi-setup-modeline ()
;;       (set-face-attribute 'region nil :foreground nil :background "lavender")
;;       (set-face-attribute 'hl-line nil :foreground nil :background "aliceblue"
;;                           :underline nil)

;;       (set-face-attribute 'mode-line nil :foreground "royalblue" :background "#dddddd"
;;                           :family "Menlo" :height 100 :weight 'normal
;;                           :box '(:line-width 4 :color "#dddddd" :style nil))

;;       (set-face-attribute 'mode-line-inactive nil :foreground "#666666"
;;                           :background "#bbbbbb" :family "Menlo" :height 100
;;                           :weight 'normal :italic t
;;                           :box '(:line-width 4 :color "#bbbbbb" :style nil)))
;;     (kfi-setup-modeline)
;;     (add-to-list 'default-frame-alist '(cursor-color . "dodgerblue"))

;;     (defun kfi-setup-light-theme-overrides ()
;;       ;;
;;       ;; Frame
;;       (set-face-attribute 'fringe nil :background "white")
;;       (set-face-attribute 'default nil :background "white")
;;       ;;
;;       ;; Font-lock (mainly Clojure)
;;       (set-face-attribute font-lock-keyword-face nil :foreground "#a61d5d" :weight 'normal)
;;       ;; Java interop
;;       (set-face-attribute font-lock-preprocessor-face nil :foreground "sienna")
;;       (set-face-attribute font-lock-function-name-face nil :foreground "black")
;;       (set-face-attribute font-lock-variable-name-face nil :foreground "dodgerblue")
;;       (set-face-attribute font-lock-constant-face nil :foreground "#0086b3")
;;       (set-face-attribute font-lock-string-face nil :slant 'normal :foreground "gray60")
;;       (set-face-attribute font-lock-comment-face nil :slant 'normal
;;                           :foreground "mediumpurple" :height 120)
;;       (set-face-attribute font-lock-type-face nil :foreground "#795da3"))

;;     (kfi-setup-light-theme-overrides)
;;     ;;
;;     )


;;   (when (and window-system dark-mode)
;;     (global-hl-line-mode 1)

;;     (invert-face 'default)

;;     (defun kfi-setup-default-theme-overrides ()
;;       ;;
;;       ;; Frame
;;       (set-face-attribute 'fringe nil :background "#151525")
;;       (set-face-attribute 'default nil :background "black")
;;       ;;
;;       ;; Font-lock
;;       (set-face-attribute font-lock-keyword-face nil :foreground "peru")
;;       (set-face-attribute font-lock-preprocessor-face nil :foreground "steelblue")
;;       (set-face-attribute font-lock-function-name-face nil :foreground "cornflowerblue")
;;      (set-face-attribute font-lock-constant-face nil :slant 'italic :foreground "mediumslateblue")
;;       (set-face-attribute font-lock-string-face nil :slant 'normal :foreground "gray60")
;;       (set-face-attribute font-lock-variable-name-face nil :foreground "sandybrown")
;;       (set-face-attribute font-lock-comment-face nil :slant 'normal :foreground "firebrick"))

;; ;;    (kfi-setup-default-theme-overrides)

;;     ;; (set-face-attribute 'hl-line nil :foreground nil :underline nil)
;;     ;; (set-face-foreground 'highlight nil)

;;     ;; (set-face-attribute 'hl-line nil :foreground nil :background "gray15"
;;     ;;                     :underline nil)

    ;; (defun kfi-setup-modeline ()
    ;;   (set-face-attribute 'region nil :foreground nil :background "blue")

    ;;   (set-face-attribute 'mode-line nil
    ;;                       :foreground "white"
    ;;                       :background "dodgerblue4"
    ;;                       :family "Monaco" :height 100 :weight 'normal
    ;;                       :box '(:line-width 2 :color "dodgerblue4" :style nil))

    ;;   (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
    ;;                       :background "gray15" :family "Menlo" :height 100
    ;;                       :weight 'normal :italic nil
    ;;                       :box '(:line-width 2 :color "gray17" :style nil))
    ;;   ;;
    ;;   )

;;     (kfi-setup-modeline)

;;     (add-to-list 'default-frame-alist '(cursor-color . "dodgerblue"))))

(defun kfi-setup-modeline ()
  (set-face-attribute 'region nil :foreground nil :background "#374350")

  (set-face-attribute 'mode-line nil
                      :foreground "#ccc"
                      :background "#374350"
                      :family "Monaco" :height 100 :weight 'normal
                      :box '(:line-width 2 :color "#374350" :style nil))

  (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                      :background "gray15" :family "Menlo" :height 100
                      :weight 'normal :italic nil
                      :box '(:line-width 2 :color "gray17" :style nil))

  (add-to-list 'default-frame-alist '(cursor-color . "dodgerblue")))

(when window-system
  (kfi-setup-modeline)
;;  (kfi-set-theme-mode)

  (global-linum-mode 0)

  ;; (defun kfi-go-dark ()
  ;;   (interactive)
  ;;   (setq dark-mode t)
  ;;   (kfi-set-theme-mode))

  ;; (defun kfi-go-light ()
  ;;   (interactive)
  ;;   (setq dark-mode nil)
  ;;   (kfi-set-theme-mode))

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
