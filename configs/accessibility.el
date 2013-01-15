;;-----------------------------------------------------------------------------
;; General stuff that makes looking at or using emacs a quantum easier.
;;-----------------------------------------------------------------------------

(defvar kfi-local-bin (concat (getenv "HOME") "/Bin") "Local execs.")

(setenv "PATH" (concat (getenv "PATH") ":" kfi-local-bin))
(setq exec-path (append exec-path (list kfi-local-bin) ))

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
(global-hl-line-mode 0)

;;-----------------------------------------------------------------------------
;; Theme related stuff
;;-----------------------------------------------------------------------------

(defvar kfi-default-theme 'underwater
  "Default theme.")

(defvar kfi-current-theme 'underwater
  "Current theme.")

(defun kfi-load-theme (theme)
  (interactive "STheme:")
  (load-theme theme t)
  (setq kfi-current-theme theme)
  (global-hl-line-mode 1)
  (blink-cursor-mode 0)
  (set-default 'cursor-type 'hollow)
  (set-face-underline 'hl-line nil))

(defun kfi-unload-theme ()
  (interactive)
  (if kfi-current-theme
      (disable-theme kfi-current-theme)
    (disable-theme kfi-default-theme))
  (setq kfi-current-theme nil))

(if (window-system)
    (kfi-load-theme kfi-default-theme))

;;-----------------------------------------------------------------------------

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

(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow)

(setq ring-bell-function 'ignore)

(setq speedbar-show-unknown-files 1)

(setq default-directory "~/Dropbox/Notes/")

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
