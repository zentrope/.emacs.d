;;-----------------------------------------------------------------------------
;; General stuff that makes Emacs slightly more usable.
;;-----------------------------------------------------------------------------

(invert-face 'default)
(setq default-directory "~/")

(defvar kfi-local-bin (concat (getenv "HOME") "/bin") "Local execs.")

(setenv "PATH" (concat (getenv "PATH") ":" kfi-local-bin))
(setq exec-path (append exec-path (list kfi-local-bin) ))

(defun kfi-x-offset ()
  (/ (display-pixel-width) 4))

(add-to-list 'initial-frame-alist `(top . 60))
(add-to-list 'initial-frame-alist `(left . ,(kfi-x-offset)))
(add-to-list 'initial-frame-alist `(width . 100))
(add-to-list 'initial-frame-alist
             (cons 'height (/ (- (display-pixel-height) 260)
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
;;(set-face-attribute 'default nil :family "Menlo" :height 120 :weight 'normal)
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow) ; '(hbar . 4)
(setq ring-bell-function 'ignore)
;;(setq speedbar-show-unknown-files 1)
;;(setq default-directory "~")

;;-----------------------------------------------------------------------------
;; Keybindings
;;-----------------------------------------------------------------------------

(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)

;; Switch to next frame, if there is one.
(global-set-key "\M-`" 'other-frame)

;;Rebind buffer-list to buffer-menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "<C-tab>") 'buffer-menu)

;;-----------------------------------------------------------------------------
;; Theme
;;-----------------------------------------------------------------------------

(load-theme 'ample t)

;; Make minibuffer have a smaller font
(add-hook 'minibuffer-setup-hook 'kfi-craft-minibuffer)

(defun kfi-craft-minibuffer ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :family "Menlo" :height 100))))

;; Make mode line less obtrusive

(set-face-attribute 'mode-line nil :foreground "gray85" :background "#333355"
                    :family "Menlo" :height 100 :weight 'normal
                    :box '(:line-width 2 :color "#333355" :style nil))

(set-face-attribute 'mode-line-inactive nil :foreground "gray60" :background "#222233"
                    :family "Menlo" :height 110 :weight 'normal :italic t
                    :box '(:line-width 2 :color "#222233" :style nil))

;;-----------------------------------------------------------------------------
;; Convenience functions
;;-----------------------------------------------------------------------------

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
