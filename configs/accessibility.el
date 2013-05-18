;;-----------------------------------------------------------------------------
;; General stuff that makes Emacs slightly more usable.
;;-----------------------------------------------------------------------------

(defvar kfi-local-bin (concat (getenv "HOME") "/Bin") "Local execs.")

(setenv "PATH" (concat (getenv "PATH") ":" kfi-local-bin))
(setq exec-path (append exec-path (list kfi-local-bin) ))

(defun kfi-x-offset ()
  (/ (display-pixel-width) 3))

(add-to-list 'initial-frame-alist `(top . 60))
(add-to-list 'initial-frame-alist `(left . ,(kfi-x-offset)))
(add-to-list 'initial-frame-alist `(width . 90))
(add-to-list 'initial-frame-alist
             (cons 'height (/ (- (display-pixel-height) 160)
                              (frame-char-height))))

;;-----------------------------------------------------------------------------

(scroll-bar-mode 0)
(tool-bar-mode 0)
;;(set-fringe-mode (cons 1 1))
(global-hl-line-mode 1)
(column-number-mode 1)
(cua-mode 1)
(show-paren-mode t)
(custom-set-variables '(indent-tabs-mode nil))
(setq-default line-spacing 0)
(setq-default inhibit-startup-screen t)
(setq-default standard-indent 2)
(add-hook 'before-save-hook 'whitespace-cleanup)
(set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow) ; '(hbar . 4)
(setq ring-bell-function 'ignore)
(setq speedbar-show-unknown-files 1)
;;(setq default-directory "~")

;;-----------------------------------------------------------------------------
;; Colors
;;-----------------------------------------------------------------------------

(setq default-frame-alist
      '((foreground-color . "grey90")
        (background-color . "#111111")
        (vertical-scroll-bars . nil)
        (cursor-color . "darkcyan")
        (width . 90)))

(set-face-foreground 'region "white")
(set-face-background 'region "#333355")

(set-face-attribute 'mode-line nil
                    :foreground "gray85"
                    :background "#333355"
                    :family "Monaco"
                    :height 100
                    :weight 'normal
                    :box '(:line-width 2 :color "#333355" :style nil))

(add-hook 'minibuffer-setup-hook 'kfi-craft-minibuffer)

(defun kfi-craft-minibuffer ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :family "Monaco" :height 100))))

(set-face-attribute 'mode-line-inactive nil
                    :foreground "gray60"
                    :background "#222233"
                    :family "Monaco"
                    :height 100
                    :weight 'normal
                    :italic t
                    :box nil)

(set-face-attribute 'hl-line nil
                    :foreground nil
                    :background "#181830"
                    :box nil)

(set-face-attribute 'fringe nil
                    :background "#111111"
                    :box '(:line-width 2 :color "white" :style nil))

(set-face-foreground 'font-lock-comment-face "grey40")
(set-face-attribute 'font-lock-comment-face nil :italic t)

;;(set-face-foreground 'font-lock-string-face "darkseagreen")
;;(set-face-attribute 'font-lock-string-face nil :italic t)

(set-cursor-color "darkcyan")
(set-face-foreground 'show-paren-match-face "black")

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "royalblue")
     (set-face-foreground 'magit-diff-del "mediumpurple")
     (set-face-background 'magit-item-highlight "#111111")))

;;-----------------------------------------------------------------------------
;; Convenience functions
;;-----------------------------------------------------------------------------

;; Switch to next frame, if there is one.
(global-set-key "\M-`" 'other-frame)

;;Rebind buffer-list to buffer-menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "<C-tab>") 'buffer-menu)

(defun kfi-set-frame-width (arg)
  (interactive "nFrame width: ")
  (set-frame-width (selected-frame) arg))

(defun kfi-set-frame-height (arg)
  (interactive "nFrame height: ")
  (set-frame-height (selected-frame) arg))

(defun kfi-set-frame-dimensions (w h)
  (interactive "nFrame width: \nnFrame height: ")
  (set-frame-width (selected-frame) w)
  (set-frame-height (selected-frame) h))

(defun kfi-back-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") 'kfi-back-window)

(defun kfi-open-this ()
  (interactive)
  (shell-command (concat "open '" (buffer-name) "'")))

(global-set-key (kbd "C-c C-x o") 'kfi-open-this)

(defun kfi-set-font-size (size)
  (interactive "nNew size: ")
  (set-face-attribute 'default nil :height size))

(defun kfi-font-size-up ()
  (interactive)
  (kfi-set-font-size (+ (face-attribute 'default :height) 10)))

(defun kfi-font-size-down ()
  (interactive)
  (kfi-set-font-size (- (face-attribute 'default :height) 10)))

;;-----------------------------------------------------------------------------
