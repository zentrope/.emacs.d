;;; kfi-flycheck -- nag!
;;; Commentary:
;;; Code:

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-gometalinter)
(flycheck-gometalinter-setup)

(provide 'kfi-flycheck)
;;; kfi-flycheck ends here
