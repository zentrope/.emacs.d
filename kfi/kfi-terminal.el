;;; kfi-terminal -- embedded terminal stuff
;;;
;;; Commentary:
;;;
;;;  Copyright (c) 2017 Keith Irwin
;;;
;;;  This program is free software: you can redistribute it and/or modify
;;;  it under the terms of the GNU General Public License as published
;;;  by the Free Software Foundation, either version 3 of the License,
;;;  or (at your option) any later version.
;;;
;;;  This program is distributed in the hope that it will be useful,
;;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;  GNU General Public License for more details.
;;;
;;;  You should have received a copy of the GNU General Public License
;;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;  Provides functions to customize the theme to my liking.
;;;
;;; Code:
;;;

(use-package multi-term
  :ensure t
  :config
  ;; Turn off yas-snippets tab-complete when in a terminal
  ;; (defun kfi/restore-tab (f &rest args)
  ;;   (apply f args)
  ;;   (yas-minor-mode -1))

  ;; (advice-add 'multi-term :around #'kfi/restore-tab)

  (defadvice term-char-mode (after term-char-mode-fixes ())
    ;; Causes a compile-log warning. Do I even need this any more?
    ;; (set (make-local-variable 'hl-line-mode) nil)
    (set (make-local-variable 'global-hl-line-mode) nil))

  (ad-activate 'term-char-mode)

  (setq multi-term-program "/bin/bash")
  (set-face-attribute 'term nil :inherit 'default)
  (set-face-attribute 'term nil :inherit 'default)
  (set-face-attribute 'term-color-cyan nil :foreground "dodgerblue")
  (set-face-attribute 'term-color-black nil :foreground "gray50")
  (set-face-attribute 'term-color-yellow nil :foreground "peru")

  (add-hook 'term-exec-hook
            (function
             (lambda ()
               (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

  (defun kfi/inhibit-line-numbers ()
    (display-line-numbers-mode -1))

  (defun kfi/term-allow-pasting-to-shell ()
    (define-key term-raw-map (kbd "C-y") 'term-paste)
    (define-key term-raw-map (kbd "C-v") 'term-paste)
    (define-key term-raw-map (kbd "s-v") 'term-paste))

  (add-hook 'term-mode-hook 'kfi/inhibit-line-numbers)
  (add-hook 'term-mode-hook 'kfi/term-allow-pasting-to-shell))

(provide 'kfi-terminal)
;;; kfi-terminal ends here
