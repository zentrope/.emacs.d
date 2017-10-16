;;; init.el --- emacs configuration
;;;
;;; License:
;;;
;;;  Copyright (c) 2017 Keith Irwin
;;;
;;;  This program is free software: you can redistribute it and/or
;;;  modify it under the terms of the GNU General Public License as
;;;  published by the Free Software Foundation, either version 3 of
;;;  the License, or (at your option) any later version.
;;;
;;;  This program is distributed in the hope that it will be useful,
;;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;;;  General Public License for more details.
;;;
;;;  You should have received a copy of the GNU General Public License
;;;  along with this program. If not, see
;;;  <http://www.gnu.org/licenses/>. Provides functions to customize
;;;  the theme to my liking.
;;;
;;; Commentary:
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
            '("melpa-stable" . "https://stable.melpa.org/packages/")
            '("gnu"          . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

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

;; (setq use-package-verbose t)

;;=============================================================================

(add-to-list 'load-path "~/.emacs.d/kfi/")

;;-----------------------------------------------------------------------------
;; buffer backups
;;-----------------------------------------------------------------------------

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq backup-inhibited t)
(setq auto-save-default nil)

;;-----------------------------------------------------------------------------

(setq-default flycheck-emacs-lisp-load-path 'inherit)

(require 'kfi-buffers)
(require 'kfi-clojure)
(require 'kfi-cursors)
(require 'kfi-elisp)
(require 'kfi-flycheck)
(require 'kfi-functions)
(require 'kfi-fuzzy)
(require 'kfi-golang)
(require 'kfi-html)
(require 'kfi-irc)
(require 'kfi-java)
(require 'kfi-keyboard)
(require 'kfi-magit)
(require 'kfi-markdown)
(require 'kfi-omnibus)
(require 'kfi-paths)
(require 'kfi-preferences)
(require 'kfi-projectile)
(require 'kfi-shell)
(require 'kfi-terminal)
(require 'kfi-theme)
(require 'kfi-web)

;; (when (not (server-running-p))
;;   (server-start))

(when (file-exists-p "~/.emacs.d/local.el")
  (load "~/.emacs.d/local.el"))

(provide 'init)
;;; init.el ends here
