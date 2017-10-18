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

(defvar kfi-packages
  '(
    ag
    cider
    clojure-mode
    clojure-mode-extra-font-locking
    command-log-mode
    company
    css-mode
    css-eldoc
    dired-details
    dirtree
    dockerfile-mode
    erc
    erc-hl-nicks
    exec-path-from-shell
    fish-mode
    flx-ido
    flycheck
    flycheck-gometalinter
    fullframe
    go-mode
    go-eldoc
    golint
    htmlize
    ido
    ido-completing-read+
    ido-vertical-mode
    js
    json-mode
    magit
    markdown-mode
    melpa-upstream-visit
    multi-term
    multiple-cursors
    olivetti
    paredit
    paren-face
    projectile
    restclient
    smex
    web-mode
    yaml-mode
    ))

(defun package-require (pkg)
  "Install PKG if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(dolist (p kfi-packages)
  (package-require p))

(defvar kfi-customizations
  '(
    kfi-buffers
    kfi-clojure
    kfi-cursors
    kfi-elisp
    kfi-flycheck
    kfi-functions
    kfi-fuzzy
    kfi-golang
    kfi-html
    kfi-irc
    kfi-java
    kfi-keyboard
    kfi-magit
    kfi-markdown
    kfi-omnibus
    kfi-paths
    kfi-preferences
    kfi-projectile
    kfi-shell
    kfi-terminal
    kfi-theme
    kfi-web
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
