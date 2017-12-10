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

(defvar kfi-packages
  '(
    erc
    erc-hl-nicks
    exec-path-from-shell
    flx-ido
    flycheck
    flycheck-gometalinter
    ido
    ido-completing-read+
    ido-vertical-mode
    smex
    ))


(dolist (p kfi-packages)
  (package-require p))

(defvar kfi-customizations
  '(
    kfi-basics
    kfi-elisp
    kfi-flycheck
    kfi-functions
    kfi-fuzzy
    kfi-irc
    kfi-keyboard
    kfi-paths
    kfi-preferences
    kfi-shell
    kfi-theme
    ))

(dolist (config kfi-customizations)
  (message "Loading %s" config)
  (require config))

(require 'server)
(or (server-running-p)
    (server-start))

(when (file-exists-p "~/.emacs.d/local.el")
  (load "~/.emacs.d/local.el"))

(provide 'init)
;;; init.el ends here
