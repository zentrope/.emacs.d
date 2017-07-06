(use-package ido
  :ensure t
  :init (progn (ido-mode 1)
               (ido-everywhere 1)
               (setq ido-enable-flex-matching t)

               (use-package ido-completing-read+
                 :ensure t
                 :init (ido-ubiquitous-mode 1))

               (use-package flx-ido ;; fuzzy matching
                 :ensure t
                 :init (progn (flx-ido-mode 1)
                              (setq ido-enable-flex-matching t)
                              (setq ido-use-faces nil)))
               (use-package ido-vertical-mode
                 :ensure t
                 :init (progn (ido-vertical-mode 1)
                              (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)))))

(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(provide 'kfi-fuzzy)
