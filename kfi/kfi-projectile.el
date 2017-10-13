  (use-package projectile
    :ensure t
    :commands projectile-mode
    :config
    (setq projectile-completion-system 'ido)
    ;;(setq projectile-completion-system 'helm)
    )

(provide 'kfi-projectile)
