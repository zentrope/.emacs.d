;; (require 'diff-hl)

;; (global-diff-hl-mode 1)

;; (defadvice magit-quit-session
;;   (after update-diff-hl activate)
;;   (dolist (buffer (buffer-list))
;;     (with-current-buffer buffer (diff-hl-update))))
