;;; init.el --- My emacs configuration
;;;
;;; Commentary:
;;;
;;; And so it begins
;;;
;;; Code:

(when window-system
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(require 'package)

;; Development
(setq package-archives
      (list '("melpa"        . "https://melpa.org/packages/")
            ;;'("melpa-stable" . "https://stable.melpa.org/packages/")
            '("gnu"          . "http://elpa.gnu.org/packages/")))

;;(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless package-archive-contents
  (package-refresh-contents))

;; https://github.com/jwiegley/use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;(setq use-package-verbose t)

;;=============================================================================

(add-to-list 'load-path "~/.emacs.d/kfi/")

;;-----------------------------------------------------------------------------
;; buffer backups
;;-----------------------------------------------------------------------------

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq backup-inhibited t)
(setq auto-save-default nil)

;;-----------------------------------------------------------------------------

(require 'kfi-globals)
(require 'kfi-paths)
(require 'kfi-omnibus)
(require 'kfi-flycheck)

(require 'kfi-buffers)
(require 'kfi-clojure)
(require 'kfi-cluj)
(require 'kfi-cursors)
(require 'kfi-elisp)
(require 'kfi-functions)
(require 'kfi-fuzzy)
(require 'kfi-golang)
(require 'kfi-html)
(require 'kfi-irc)
(require 'kfi-java)
(require 'kfi-keyboard)
(require 'kfi-magit)
(require 'kfi-markdown)
(require 'kfi-org)
(require 'kfi-preferences)
(require 'kfi-projectile)
(require 'kfi-shell)
(require 'kfi-terminal)
(require 'kfi-theme)
(require 'kfi-web)

(when (not (server-running-p))
  (server-start))

(when (file-exists-p "~/.emacs.d/local.el")
  (load "~/.emacs.d/local.el"))

;;; init.el ends here
