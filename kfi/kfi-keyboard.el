;;-----------------------------------------------------------------------------
;; Keybindings
;;-----------------------------------------------------------------------------

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

;;Rebind buffer-list to buffer-menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "<C-tab>") 'buffer-menu)

(global-set-key (kbd "C-c C-x r")
                #'(lambda ()
                    (interactive)
                    (find-file "/Users/keith/dripbox/org-work/scratch.org")))

(global-set-key (kbd "C-c C-x h")
                #'(lambda ()
                    (interactive)
                    (find-file "/Users/keith/dripbox/org-home/home.org")))

(setq initial-scratch-message
      (concat ";; C-c C-x r   -> org-work/scratch.org\n"
              ";; C-c C-x h   -> org-home/home.org\n"
              "\n\n"))

(provide 'kfi-keyboard)
