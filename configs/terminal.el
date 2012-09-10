;; terminal.el

;; Turn off current-line-highlighting and auto-pair.
(defadvice term-char-mode (after term-char-mode-fixes ())
  (autopair-mode -1)
  (set (make-local-variable 'hl-line-mode) nil)
  (set (make-local-variable 'global-hl-line-mode) nil))

(ad-activate 'term-char-mode)
