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

(require 'package)

;; Development
(setq package-archives
      (list '("melpa"        . "https://melpa.org/packages/")
            '("gnu"          . "https://elpa.gnu.org/packages/")
            '("org"          . "https://orgmode.org/elpa/")))

;; Initialise the packages, avoiding a re-initialisation.
(unless (bound-and-true-p package--initialized)
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Make sure `use-package' is available.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun kfi/package-require (pkgs)
  "Install PKGs if not already installed."
  (dolist (pkg pkgs)
    (when (not (package-installed-p pkg))
      (message "Loading %s" pkg)
      (package-install pkg))))

(kfi/package-require '(delight diminish bind-key))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'delight)
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
