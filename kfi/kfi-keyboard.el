;;-----------------------------------------------------------------------------
;; Keybindings
;;-----------------------------------------------------------------------------

(setq mac-command-modifier 'super)
(global-set-key (kbd "s-p") 'projectile-find-file)

;; On OSX C-M-@ amd M-S-SPC doesn't work in a terminl.
(global-set-key (kbd "C-M-SPC") 'mark-sexp)
(global-set-key (kbd "M-RET") 'mark-sexp)

;; GUI
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)

(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "s-_") 'text-scale-decrease)

;; Switch to next frame, if there is one.
(global-set-key (kbd "M-`") 'other-frame)

(provide 'kfi-keyboard)
