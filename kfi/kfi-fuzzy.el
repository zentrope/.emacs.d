(use-package ido
  :ensure t
  :init
  (progn (ido-mode 1)

         (setq ido-enable-flex-matching t)
         (setq ido-everywhere t)

         (use-package ido-ubiquitous
           :ensure t
           :init (ido-ubiquitous-mode))
         (use-package flx-ido
           :ensure t
           :init
           (flx-ido-mode 1)
           (setq ido-enable-flex-matching t)
           (setq ido-use-faces nil))
         (use-package ido-vertical-mode
           :ensure t
           :init
           (ido-vertical-mode 1)
           (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))))

(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(provide 'kfi-fuzzy)
