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

(provide 'kfi-preferences)
