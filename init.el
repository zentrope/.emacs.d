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
            '("gnu"          . "https://elpa.gnu.org/packages/")
            '("org"          . "https://orgmode.org/elpa/")))

;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
;; This seems to matter when running on FreeBSD

(when (eq system-type 'berkeley-unix)
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

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

(defun kfi/refresh-config ()
  "Convert and load the configuration.org file only if it's newer
than the output file."
  (interactive)
  (let* ((root "~/.emacs.d/configuration")
         (org-file (concat root ".org"))
         (el-file (concat root ".el")))
    (if (file-newer-than-file-p org-file el-file)
        (progn
          (message "Re-tangling %s because it's newer than %s." org-file el-file)
          (org-babel-load-file org-file))
      (progn
  (message "No need to re-tangle %s." org-file)
  (load el-file)))))

(kfi/refresh-config)


(use-package kfi-basics :load-path "kfi/kfi-basics")

(when (file-exists-p "~/.emacs.d/local.el")
  (load "~/.emacs.d/local.el"))

(provide 'init)
;;; init.el ends here
