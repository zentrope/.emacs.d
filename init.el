;;; init.el --- emacs configuration
;;; Commentary:
;;; Code:

(when (display-graphic-p)
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(require 'package)

;; Development
(setq package-archives
      (list '("melpa"        . "https://melpa.org/packages/")
            '("melpa-stable" . "https://stable.melpa.org/packages/")
            '("gnu"          . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;;-----------------------------------------------------------------------------

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(defun package-require (pkg)
  "Install PKG if it's not already installed."
  (when (not (package-installed-p pkg))
    (message "Loading %s" pkg)
    (package-install pkg)))

(dolist (p '(delight diminish bind-key))
  (package-require p))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;-----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/kfi/")

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq backup-inhibited t)
(setq auto-save-default nil)

(setq-default flycheck-emacs-lisp-load-path 'inherit)

(use-package kfi-basics      :load-path "kfi/kfi-basics")
(use-package kfi-functions   :load-path "kfi/kfi-functions")
(use-package kfi-preferences :load-path "kfi/kfi-preferences")

(use-package kfi-theme
  :demand
  :load-path "kfi/kfi-theme"
  :bind (("C-c m 1" . kfi/heavy-font)
         ("C-c m 2" . kfi/normal-font)
         ("C-c m 3" . kfi/thin-font))
  :config
  (when (display-graphic-p)
    (kfi/light)
    (kfi/normal-font)))

(require 'server)
(or (server-running-p)
    (server-start))

(when (file-exists-p "~/.emacs.d/local.el")
  (load "~/.emacs.d/local.el"))

(provide 'init)
;;; init.el ends here
