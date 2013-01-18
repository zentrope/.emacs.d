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
(set-fringe-mode '(0.5 0.5))
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
(set-default 'cursor-type '(hbar . 4))
(setq ring-bell-function 'ignore)
(setq speedbar-show-unknown-files 1)
(setq default-directory "~/Dropbox/Notes/")

;;-----------------------------------------------------------------------------
;; Colors
;;-----------------------------------------------------------------------------

(set-background-color "#111111")
(set-foreground-color "grey90")
(set-face-background 'region "darkslateblue")
(set-face-background 'hl-line "#181830")
(set-face-background 'fringe "#161616")

(set-face-foreground 'font-lock-comment-face "grey40")
(set-face-attribute 'font-lock-comment-face nil :italic t)

(set-face-foreground 'font-lock-string-face "darkseagreen")
(set-face-attribute 'font-lock-string-face nil :italic t)

(set-cursor-color "darkgoldenrod")
(set-face-foreground 'show-paren-match-face "black")

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "royalblue")
     (set-face-foreground 'magit-diff-del "mediumpurple")
     (set-face-background 'magit-item-highlight "#111111")))

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
