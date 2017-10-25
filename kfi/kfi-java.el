;;; kfi-java --- config
;;; Commentary:
;;; Code:

;;; meghanada is a good Java mode, if you need it.

(defvar c-basic-offset)

(defun kfi/java-hook ()
  "Set up java mode preferences."
  (setq c-basic-offset 2
        tab-width 2
        indent-tabs-mode nil))

(add-hook 'java-mode-hook #'kfi/java-hook)

(provide 'kfi-java)
;;; kfi-java.el ends here
