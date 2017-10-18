(eval-after-load 'multiple-cursors
  '(progn (global-set-key (kbd "C-M->") 'mc/mark-all-like-this)
          (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
          (global-set-key (kbd "C->") 'mc/mark-next-like-this)))

(provide 'kfi-cursors)
