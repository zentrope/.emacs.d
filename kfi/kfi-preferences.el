;;; kfi-preferences -- general settings and preferences
;;;
;;; License:
;;;
;;;   Copyright (c) 2017 Keith Irwin
;;;
;;;   This program is free software: you can redistribute it and/or modify
;;;   it under the terms of the GNU General Public License as published
;;;   by the Free Software Foundation, either version 3 of the License,
;;;   or (at your option) any later version.
;;;
;;;   This program is distributed in the hope that it will be useful,
;;;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;   GNU General Public License for more details.
;;;
;;;   You should have received a copy of the GNU General Public License
;;;   along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;   Provides functions to customize the theme to my liking.
;;;
;;; Commentary:
;;;
;;; Code:
;;;

;; Global Auto Revert mode is a global minor mode that reverts any
;; buffer associated with a file when the file changes on disk.
(global-auto-revert-mode 1)

;; Do not wrap lines when they're too long
(setq-default truncate-lines t)

;; Extend the EOL column
(setq fill-column 80)

;; (use-package smooth-scrolling
;;   :ensure t
;;   :config
;;   (smooth-scrolling-mode 1))

;; banish custom config to another file
(setq custom-file "~/.emacs.d/custom.el")

;; UTF0-8 (still necessary?)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;; Don't require spelling out yes or no.
(fset 'yes-or-no-p 'y-or-n-p)

;; etc

(delete-selection-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(if window-system
    (progn (scroll-bar-mode 0)
           (global-hl-line-mode 1)
           (fringe-mode '(10 . 10)))
  (progn (global-hl-line-mode 1)
         (set-face-background 'hl-line "gray13")
         (menu-bar-mode 0)))

(column-number-mode 1)
(cua-mode 1)
(show-paren-mode t)
(custom-set-variables '(indent-tabs-mode nil))
(setq-default line-spacing 1)
(setq-default inhibit-startup-screen t)
(setq-default standard-indent 2)
(setq-default tab-width 2)
(add-hook 'before-save-hook 'whitespace-cleanup)
(set-face-attribute 'default nil
                    :family "Menlo"
                    ;; :family "Monaco"
                    ;; :family "Input Mono Narrow"
                    :height 120
                    :weight 'normal
                    ;; :weight 'thin
                    )
(blink-cursor-mode 0)
(set-default 'cursor-type 'hollow)
(setq ring-bell-function 'ignore)


;;-----------------------------------------------------------------------------
;; Line numbers mode
;;-----------------------------------------------------------------------------

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode 1)
  (setq display-line-numbers-grow-only t)
  (setq display-line-numbers-width-start 1000))

;;-----------------------------------------------------------------------------

(defun kfi/fix-echo-area ()
  "Set the font for the message window."
  (let ((buf (get-buffer " *Echo Area 0*")))
    (when buf
      (with-current-buffer buf
        (setq-local face-remapping-alist '((default :family "Monaco" :weight normal :height 100)))))))

(defun kfi/craft-minibuffer ()
  "Set the font for the minibuffer."
  (set (make-local-variable 'face-remapping-alist)
       '((default :family "Monaco" :weight normal :height 100))))

(when window-system
  (add-hook 'minibuffer-setup-hook 'kfi/craft-minibuffer)
  (kfi/fix-echo-area)
  (kfi/craft-minibuffer))

(setq ns-use-srgb-colorspace t)

(provide 'kfi-preferences)
;;; kfi-preferences ends here
