(use-package meghanada
  :ensure t
  :config

  (defun kfi/java-hook ()
    (setq c-basic-offset 2
          tab-width 2
          indent-tabs-mode nil))

  (defun kfi/meghanada-hook ()
    (meghanada-mode t)
    (meghanada-flycheck-enable)
    (add-hook 'before-save-hook 'delete-trailing-whitespace))

  (add-hook 'java-mode-hook #'kfi/java-hook)
  (add-hook 'java-mode-hook #'kfi/meghanada-hook))

(provide 'kfi-java)
