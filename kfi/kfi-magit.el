;;; kfi-magit --- config
;;; Commentary:
;;; Code:

(defvar magit-status-mode-map)

(defun kfi/magit-start-session ()
  "Go full screen when invoking magit-status."
  (interactive)
  (window-configuration-to-register :magit-fullscreen)
  (call-interactively 'magit-status)
  (delete-other-windows))

(defun kfi/magit-log-session ()
  "Go full screen when invoking magit-log."
  (interactive)
  (window-configuration-to-register :magit-fullscreen)
  (call-interactively 'magit-log)
  (delete-other-windows))

(defun kfi/magit-quit-session ()
  "Quit the magit session and restore windows."
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(with-eval-after-load 'magit
  (define-key magit-status-mode-map (kbd "q") 'kfi/magit-quit-session))

(global-set-key (kbd "C-c g") 'kfi/magit-start-session)
(global-set-key (kbd "C-c l") 'kfi/magit-log-session)

(provide 'kfi-magit)
;;; kfi-magit.el ends here
