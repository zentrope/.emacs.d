;; Courtesy Magnars
(defadvice magit-status (around magit-fullscreen activate)
  "Go full screen when invoking magit-status."
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restore the previous window configuration and kill the magit buffer."
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(eval-after-load 'magit
  '(define-key magit-status-mode-map (kbd "q") 'magit-quit-session))

(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c l") 'magit-log)

(provide 'kfi-magit)
