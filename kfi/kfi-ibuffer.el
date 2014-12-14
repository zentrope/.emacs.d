;; ibuffer
;; http://www.emacswiki.org/cgi-bin/wiki/IbufferMode

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<C-tab>") 'ibuffer)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("clojure" (mode . clojure-mode))
               ("web" (or (mode . css-mode)
                          (mode . html-mode)
                          (mode . js-mode)))
               ("elisp" (mode . emacs-lisp-mode))
               ("dirs" (mode . dired-mode))
               ("temps" (name . "^\\*.*\\*$"))
               ;;
               ))))

(add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'kfi-ibuffer)
