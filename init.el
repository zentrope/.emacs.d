;;; init.el --- emacs configuration
;;
;; Copyright © 2017-present Keith Irwin
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.
;;
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
            '("marmalade"    . "https://marmalade-repo.org/packages/")
            '("gnu"          . "https://elpa.gnu.org/packages/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(when (version< emacs-version "27.0.50")
  (message "package initialize")
  (package-initialize))

(unless package-archive-contents
  (package-initialize)
  ;; This is what calls out to the net on start up.
  ;; (package-refresh-contents)
  )

;;-----------------------------------------------------------------------------

(message "checking for use package")
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(defun package-require (pkg)
  "Install PKG if it's not already installed."
  (when (not (package-installed-p pkg))
    (message "Loading %s" pkg)
    (package-install pkg)))

(defconst pre-reqs '(delight diminish bind-key))

(message "requiring packages")
(dolist (p pre-reqs)
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
(setq auto-save-list-file-prefix nil)

(setq-default flycheck-emacs-lisp-load-path 'inherit)


;; FIXME: Only do this if you can figure out if the org file is older
;; maybe [[https://www.reddit.com/r/emacs/comments/8gbopk/tip_how_to_speed_up_your_emacs_config_by_03/]]
(org-babel-load-file "~/.emacs.d/configuration.org")

(use-package kfi-basics :load-path "kfi/kfi-basics")

(when (file-exists-p "~/.emacs.d/local.el")
  (load "~/.emacs.d/local.el"))

(provide 'init)
;;; init.el ends here
