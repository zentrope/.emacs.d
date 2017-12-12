;;; kfi-basics --- configure basic packages
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

(use-package ag
  :ensure t)

(use-package cc-mode
  :init
  (add-hook 'java-mode-hook (lambda ()
                              (setq c-basic-offset 2)
                              (setq tab-width 2)
                              (setq indent-tabs-mode nil))))

(use-package cider
  :commands cider-mode
  :ensure t
  :delight "cidr"
  :init
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook 'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  :config
  (setq cider-font-lock-dynamically '(macro core function var))
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-overlays-use-font-lock t)
  (setq cider-repl-use-pretty-printing 1))

(use-package clojure-mode-extra-font-locking
  :ensure t)

(use-package clojure-mode
  :commands clojure-mode
  :ensure t
  :delight "clj"
  :config
  (add-hook 'clojure-mode-hook 'prettify-symbols-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'cider-mode)
  (setq clojure-indent-style nil))

(use-package company
  :ensure t)

(use-package css-mode
  :commands css-mode
  :init
  (add-hook 'css-mode-hook (lambda ()
                             (company-mode 1)
                             ;; (set (make-local-variable 'company-backends) '(company-css))
                             ;; (turn-on-css-eldoc)
                             (setq css-indent-offset 2)
                             (local-set-key (kbd "TAB") 'company-complete)
                             (local-set-key (kbd "RET") 'newline-and-indent))))

(use-package css-eldoc
  :ensure t)

(use-package dired
  :bind ("C-c C-w C-d" . wdired-change-to-wdired-mode)
  :after dired-details
  :config
  ;;
  (dired-details-install)
  (when (string= system-type "darwin")
    (setq dired-use-ls-dired nil)))

(use-package dired-details
  :ensure t
  :config
  (setq-default dired-details-hidden-string "[…] ")
  (dired-details-install))

(use-package dockerfile-mode
  :commands dockerfile-mode
  :ensure t)

(use-package prog-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook '(lambda ()
                                     (paredit-mode 1)
                                     (setq indent-tabs-mode nil)
                                     (local-set-key (kbd "RET") 'newline-and-indent))))

(defvar erc-truncate-buffer-on-save)
(defvar erc-max-buffer-size)
(defvar erc-scroll-to-bottom)
(declare-function erc-scrolltobottom-mode "erc.el")
(declare-function erc-update-modules "erc.el")

(use-package erc
  :config
  (defun kfi/erc-mode-hook ()
    (make-local-variable 'global-hl-line-mode)
    (setq global-hl-line-mode nil))

  (add-hook 'erc-mode-hook 'kfi/erc-mode-hook)

  ;; Not sure if this is necessary.
  (add-to-list 'erc-modules 'truncate)
  (add-to-list 'erc-modules 'scrolltobottom)
  (erc-update-modules)

  (erc-scrolltobottom-mode 1)

  (setq erc-hide-list '("JOIN" "PART" "QUIT"))
  (setq erc-fill-prefix "    ")
  (setq erc-prompt (lambda () (concat "\n" (buffer-name) " >")))

  (setq erc-fill-column 79)
  (setq erc-scroll-to-bottom -2)
  (setq erc-truncate-buffer-on-save t)
  (setq erc-max-buffer-size 30000)

  (add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
  (setq erc-truncate-buffer-on-save t))

(use-package erc-hl-nicks
  :ensure t)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-copy-env "JAVA_HOME")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-initialize))

(use-package fish-mode
  :commands fish-mode
  :ensure t)

(use-package flycheck
  :ensure t
  :commands (flycheck-mode global-flycheck-mode)
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-gometalinter
  :ensure t
  :config
  (flycheck-gometalinter-setup))

(use-package fullframe
  :ensure t)

(use-package go-eldoc
  :ensure t)

(defvar gofmt-command)
(use-package go-mode
  :ensure t
  :commands go-mode
  :init
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'flycheck-mode)
  :config
  (setq gofmt-command "goimports"))

(use-package golint
  :ensure t)

(use-package html-mode
  :commands html-mode
  :init
  (add-hook 'html-mode-hook
            (lambda ()
              (local-set-key (kbd "RET") 'newline-and-indent))))

(use-package htmlize
  :ensure t)

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)
         ("<C-tab>" . ibuffer))
  :config
  (defvar ibuffer-saved-filter-groups
    (quote (("default"
             ("org" (mode . org-mode))
             ("clojure" (mode . clojure-mode))
             ("clojure-script" (mode . clojurescript-mode))
             ("go-lang" (mode . go-mode))
             ("web" (or (mode . css-mode)
                        (mode . html-mode)
                        (mode . js-mode)))
             ("erc" (name . "^\\#"))
             ("elisp" (mode . emacs-lisp-mode))
             ("dirs" (mode . dired-mode))
             ("temps" (name . "^\\*.*\\*$"))))))
  (add-hook 'ibuffer-mode-hook
            '(lambda ()
               (ibuffer-switch-to-saved-filter-groups "default"))))

(declare-function ido-everywhere "ido.el")

(use-package ido
  :commands ido-mode
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (setq ido-enable-flex-matching t))

(use-package ido-completing-read+
  :ensure t
  :defer t
  :commands ido-ubiquitous-mode
  :config
  (ido-ubiquitous-mode 1))

(use-package flx-ido
  :ensure t
  :defer t
  :config
  (flx-ido-mode 1)
  (setq ido-use-faces nil))

(defvar ido-vertical-define-keys)

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

(use-package smex
  :ensure t
  :defer t
  :bind (("M-x" . smex)))

(defvar js-indent-level)
(use-package js-mode
  :commands js-mode
  :init
  (add-hook 'js-mode-hook (lambda ()
                            (setq indent-tabs-mode nil)
                            (setq js-indent-level 2)
                            (local-set-key (kbd "RET") 'newline-and-indent))))

(use-package json-mode
  :ensure t
  :commands json-mode
  :init
  (add-hook 'js-mode-hook (lambda ()
                            (setq indent-tabs-mode nil)
                            (setq js-indent-level 2)
                            (local-set-key (kbd "RET") 'newline-and-indent))))

(use-package magit
  :ensure t
  :bind (("C-c g" . kfi/magit-start-session)
         ("C-c l"  . kfi/magit-log-session)
         :map magit-status-mode-map
         ("q" . kfi/magit-quit-session))
  :config

  (defun kfi/magit-start-session ()
    "Go full screen when invoking magit-status."
    (interactive)
    (window-configuration-to-register :magit-fullscreen)
    (call-interactively 'magit-status)
    (delete-other-windows))

  (defun kfi/magit-log-session ()
    "Go full screen when invoking magit-log."
    (interactive)
    (window-configuration-to-register :magit-fullscreen)
    (call-interactively 'magit-log)
    (delete-other-windows))

  (defun kfi/magit-quit-session ()
    "Quit the magit session and restore windows."
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen)))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("readme\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package melpa-upstream-visit
  :ensure t)

(use-package multi-term
  :ensure t
  :commands multi-term
  :bind (("C-c h" . multi-term))
  :config
  (defadvice term-char-mode (after term-char-mode-fixes ())
    "Causes a compile-log warning."
    ;; (set (make-local-variable 'hl-line-mode) nil)
    (set (make-local-variable 'global-hl-line-mode) nil))

  (ad-activate 'term-char-mode)

  (setq multi-term-program "/usr/local/bin/fish")
  (set-face-attribute 'term nil :inherit 'default)
  (set-face-attribute 'term nil :inherit 'default)
  (set-face-attribute 'term-color-cyan nil :foreground "dodgerblue")
  (set-face-attribute 'term-color-blue nil :foreground "dodgerblue")
  (set-face-attribute 'term-color-black nil :foreground "gray50")
  (set-face-attribute 'term-color-yellow nil :foreground "peru")

  (add-hook 'term-exec-hook
            (function
             (lambda ()
               (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

  (add-hook 'term-mode-hook (lambda ()
                              (display-line-numbers-mode -1)))
  (add-hook 'term-mode-hook (lambda ()
                              (define-key term-raw-map (kbd "C-y") 'term-paste)
                              (define-key term-raw-map (kbd "C-v") 'term-paste)
                              (define-key term-raw-map (kbd "s-v") 'term-paste)))
  (add-hook 'eshell-mode-hook (lambda ()
                                (display-line-numbers-mode -1))))

(use-package multiple-cursors
  :commands multiple-cursors-mode
  :ensure t
  :config
  (setq mac-command-modifier 'super)
  :bind (("C-S-c k" . mc/edit-lines)
         ("C-M->" . mc/mark-all-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)))

(use-package olivetti
  :ensure t)

(use-package paredit
  :ensure t
  :commands paredit-mode
  :delight " par ")

(use-package paren-face
  :ensure t
  :config
  (global-paren-face-mode 1))

(use-package projectile
  :ensure t
  :bind (("s-p" . projectile-find-file)
         ("C-c p" . projectile-find-file))
  :init
  (setq projectile-completion-system 'ido))

(use-package sh-script
  :commands shell-script-mode
  :init
  (add-hook 'sh-mode-hook '(lambda ()
                             (setq sh-basic-offset 2))))

(use-package web-mode
  :ensure t
  :commands web-mode
  :mode (("\\.html?\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-content-types (cons '("jsx" . "\\.js\\'") web-mode-content-types))
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "cornflowerblue")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "goldenrod"))

(use-package yaml-mode
  :commands yaml-mode
  :ensure t)

(provide 'kfi-basics)
;;; kfi-basics.el ends here
