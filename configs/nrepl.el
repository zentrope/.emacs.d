(require 'nrepl)

(setq nrepl-popup-stacktraces nil)
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; Comment out the following if you get locked up buffers.

(require 'ac-nrepl)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
