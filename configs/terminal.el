;; terminal.el

;; Turn off current-line-highlighting when using the terminal.
(defadvice term-char-mode (after term-char-mode-fixes ())
  (set (make-local-variable 'hl-line-mode) nil)
  (set (make-local-variable 'global-hl-line-mode) nil))

(ad-activate 'term-char-mode)
