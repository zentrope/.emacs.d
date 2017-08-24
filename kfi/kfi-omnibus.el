;;
;; Grabag of minimally configured stuff.
;;
(use-package command-log-mode
  :ensure t)

(use-package dirtree
  :ensure t)

(use-package fullframe
  ;; https://github.com/tomterl/fullframe
  :ensure t)

(use-package dired-details
  :ensure t
  :config
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install))

(use-package ag
  :ensure t)

(use-package paredit
  :ensure t)

(use-package company
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package melpa-upstream-visit
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package olivetti
  :ensure t)

(provide 'kfi-omnibus)
