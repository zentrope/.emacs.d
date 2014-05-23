(require 'helm)
(require 'helm-package)
(require 'helm-ls-git)

(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c d") 'helm-browse-project)

(helm-mode 1)
(provide 'kfi-helm)
