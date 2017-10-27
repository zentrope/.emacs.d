;;; kfi-omnibus -- small packages
;;; Commentary:
;;; Code:

(declare-function dired-details-install "dired-details.el")
(defvar dired-use-ls-dired)

(with-eval-after-load 'dired
  (global-set-key (kbd "C-c C-w C-d") 'wdired-change-to-wdired-mode)
  (when (string= system-type "darwin")
     (setq dired-use-ls-dired nil))
  (require 'dired-details)
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install))

(provide 'kfi-omnibus)
;;; kfi-omnibus ends here
