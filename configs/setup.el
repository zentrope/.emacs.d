;;-----------------------------------------------------------------------------
;; Locations
;;-----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/backups")))

(when (equal system-type 'darwin)
  (push "/usr/texbin" exec-path)
  (push "/usr/local/bin" exec-path))

;; Move to a flyspell config file?

(setq-default ispell-program-name "/usr/local/bin/aspell")

(setq ns-use-srgb-colorspace t)
