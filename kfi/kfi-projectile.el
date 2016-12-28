  (use-package projectile
    :ensure t
    :commands projectile-global-mode
    :config
    (setq projectile-completion-system 'ido)
    ;;(setq projectile-completion-system 'helm)
    )

(provide 'kfi-projectile)
