;;
;;
(defvar ido-cur-list nil
  "Fix for byte compile warning with ido-completing-read+. Far as
   I can tell, ido-cur-list isn't defined anywhere (anymore?).")

(use-package ido
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (setq ido-enable-flex-matching t)

  (use-package ido-completing-read+
    :ensure t
    :config
    (ido-ubiquitous-mode 1))

  (use-package flx-ido
    ;; Makes fuzzy match prettier?
    :ensure t
    :config
    (flx-ido-mode 1)
    (setq ido-use-faces nil))

  (use-package ido-vertical-mode
    :ensure t
    :config
    (ido-vertical-mode 1)
    (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)))

(use-package smex
  :ensure t
  :bind
  ("M-x" . smex))

(provide 'kfi-fuzzy)
