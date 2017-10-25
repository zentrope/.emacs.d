;;; kfi-omnibus -- small packages
;;; Commentary:
;;; Code:

(declare-function dired-details-install "dired-details.el")
(defvar dired-use-ls-dired)

(with-eval-after-load 'dired
  (when (string= system-type "darwin")
     (setq dired-use-ls-dired nil))
  (require 'dired-details)
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install))

(provide 'kfi-omnibus)
;;; kfi-omnibus ends here
