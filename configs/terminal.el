
;; Turn off line highlighting when using the terminal.

(defadvice term-char-mode (after term-char-mode-fixes ())
  (set (make-local-variable 'global-hl-line-mode) nil))

(ad-activate 'term-char-mode)
