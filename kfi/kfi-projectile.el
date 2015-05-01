(require 'projectile)

;; https://github.com/bbatsov/projectile

(add-hook 'clojure-mode-hook 'projectile-mode)
(add-hook 'elisp-mode-hook 'projectile-mode)

(provide 'kfi-projectile)
