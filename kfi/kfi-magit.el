(use-package magit
  :ensure t
  :config

  (defun kfi-toggle-magit-revert-buffers ()
    (interactive)
    (setq magit-revert-buffers
          (if (eq nil magit-revert-buffers)
              (progn
                (message "Setting revert-buffers to 'usage.")
                'usage)
            (progn
              (message "Setting revert-buffers to nil.")
              nil))))

  ;; Courtesy Magnars
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (defun magit-quit-session ()
    "Restores the previous window configuration and kills the magit buffer"
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen))

  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

  (global-set-key (kbd "C-c g") 'magit-status)
  (global-set-key (kbd "C-c l") 'magit-log))

(provide 'kfi-magit)
