;; terminal.el

(require 'multi-term)

;; Turn off current-line-highlighting and auto-pair.
(defadvice term-char-mode (after term-char-mode-fixes ())
  (autopair-mode -1)
  (set (make-local-variable 'hl-line-mode) nil)
  (set (make-local-variable 'global-hl-line-mode) nil))

(ad-activate 'term-char-mode)

(setq multi-term-program "/bin/bash")

(custom-set-variables
 ;; Should figure out a way to query the current
 ;; background color and subtitute it here.
 '(term-default-bg-color "#111111")
;; '(term-default-fg-color "#bbbbbb")
 '(term-default-fg-color "#bbbbbb")
 )
