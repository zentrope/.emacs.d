;; Global Auto Revert mode is a global minor mode that reverts any
;; buffer associated with a file when the file changes on disk.
(global-auto-revert-mode 1)

;; Do not wrap lines when they're too long
(setq-default truncate-lines t)

;; Extend the EOL column
(setq fill-column 80)


;; Try for a smooth scrolling experience
;; - https://github.com/joodie/emacs-literal-config/blob/master/emacs.org
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(quote (0.01)))


;; banish custom config to another file
(setq custom-file "~/.emacs.d/custom.el")


;; UTF0-8 (still necessary?)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; Don't require spelling out yes or no.
(fset 'yes-or-no-p 'y-or-n-p)

;; etc

(delete-selection-mode 1)
(tool-bar-mode 0)
(setq scroll-step 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(if window-system
    (progn (scroll-bar-mode 0)
           (global-hl-line-mode 1)
           (fringe-mode '(10 . 10)))
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
(set-face-attribute 'default nil :family "Input Mono Narrow" :height 120 :weight 'thin)
;;(set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal)
;;(set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow)
(setq ring-bell-function 'ignore)

(when window-system
  ;;
  ;; Not sure if this works.
  (defun kfi/fix-echo-area ()
    (interactive)
    (with-current-buffer (get-buffer " *Echo Area 0*")
      (setq-local face-remapping-alist '((default :family "Input Mono Narrow" :weight thin :height 100)))))

  ;; Make minibuffer have a smaller font
  (add-hook 'minibuffer-setup-hook 'kfi/craft-minibuffer)

  (defun kfi/craft-minibuffer ()
    (interactive)
    (set (make-local-variable 'face-remapping-alist)
         '((default :family "Input Mono Narrow" :weight thin :height 100))))

  (kfi/fix-echo-area)
  (kfi/craft-minibuffer))

(setq ns-use-srgb-colorspace t)



(provide 'kfi-preferences)
