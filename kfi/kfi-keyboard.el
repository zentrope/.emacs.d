(setq mac-command-modifier 'super)

;; Have I duped this somewhere else?
(global-set-key (kbd "s-p") 'projectile-find-file)

;; On OSX C-M-@ amd M-S-SPC doesn't work when running in a
;; terminal.
(global-set-key (kbd "C-M-SPC") 'mark-sexp)
(global-set-key (kbd "M-RET") 'mark-sexp)

;; GUI
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)

;; Mimics normal Mac keybindings for font resizing
(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "s-_") 'text-scale-decrease)

;; Switch to next frame, if there is one.
(global-set-key (kbd "M-`") 'other-frame)

;; Quick access to sshell
;;(global-set-key (kbd "C-c h") 'eshell)
(global-set-key (kbd "C-c h") 'multi-term)

(global-set-key (kbd "C-c m 1")
                (lambda ()
                  (interactive)
                  (set-face-attribute 'default nil :family "Monaco" :height 120 :weight 'normal)))

(global-set-key (kbd "C-c m 2")
                (lambda ()
                  (interactive)
                  (set-face-attribute 'default nil :family "Input Mono Narrow" :height 120 :weight 'normal)))

(global-set-key (kbd "C-c m 3")
                (lambda ()
                  (interactive)
                  (set-face-attribute 'default nil :family "Input Mono Narrow" :height 120 :weight 'thin)))

(global-set-key (kbd "C-c s")
                (lambda ()
                  (interactive)
                  (switch-to-buffer (get-buffer-create "*scratch*"))
                  (emacs-lisp-mode)
                  (when (eq (length (buffer-string)) 0)
                    (insert ";; scratch\n\n"))))

(provide 'kfi-keyboard)
