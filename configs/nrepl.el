(require 'nrepl)

(setq nrepl-popup-stacktraces nil)

;; This stuff is still too immature. As in, I get locked up buffers.

;;(require 'ac-nrepl)

;;(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
;;(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)

;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'nrepl-mode))
