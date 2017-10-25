;;; kfi-cursors --- configure multiple-cursors
;;; Commentary:
;;; Code:

(defun kfi/cursors ()
  "Load multiple-cursors."
  (interactive)
  (require 'multiple-cursors))

(with-eval-after-load 'multiple-cursors
  (setq mac-command-modifier 'super)
  (global-set-key (kbd "C-S-c k") 'mc/edit-lines)
  (global-set-key (kbd "C-M->") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this))

(provide 'kfi-cursors)
;;; kfi-cursors.el ends here
