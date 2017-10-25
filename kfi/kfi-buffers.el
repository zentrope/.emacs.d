;;; kfi-buffers.el -- buffers
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<C-tab>") 'ibuffer)

(declare-function ibuffer-switch-to-saved-filter-groups "ibuf-ext.el")

(defvar ibuffer-saved-filter-groups
      (quote (("default"
               ("org" (mode . org-mode))
               ("clojure" (mode . clojure-mode))
               ("clojure-script" (mode . clojurescript-mode))
               ("go-lang" (mode . go-mode))
               ("web" (or (mode . css-mode)
                          (mode . html-mode)
                          (mode . js-mode)))
               ("erc" (name . "^\\#"))
               ("elisp" (mode . emacs-lisp-mode))
               ("dirs" (mode . dired-mode))
               ("temps" (name . "^\\*.*\\*$"))
               ;;
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'kfi-buffers)
;;; kfi-buffers.el ends here
