;;
;; meghanada is a good Java mode, if you need it.
;;

(defun kfi/java-hook ()
  (setq c-basic-offset 2
        tab-width 2
        indent-tabs-mode nil))

(add-hook 'java-mode-hook #'kfi/java-hook)

(provide 'kfi-java)
