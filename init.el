;; REWRITE

(when window-system
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(defun arrange-frame (w h x y)
  (let ((frame (selected-frame)))
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

(when window-system
  (let ((w 100)
        (h 60)
        (x 1000)
        (y 100))
    (arrange-frame w h x y)))

;;-----------------------------------------------------------------------------

(require 'package)

;; Development
(setq package-archives
      (list '("melpa"        . "http://melpa.org/packages/")
            '("melpa-stable" . "http://stable.melpa.org/packages/")
            '("gnu"          . "http://elpa.gnu.org/packages/")
            '("org"          . "http://orgmode.org/elpa/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq use-package-verbose t)

(org-babel-load-file (concat user-emacs-directory "config.org"))

(use-package ido
  :init
  (progn (ido-mode 1)

         (setq ido-enable-flex-matching t)
         (setq ido-everywhere t)

         (use-package ido-ubiquitous
           :ensure t
           :init (ido-ubiquitous-mode))
         (use-package ido-vertical-mode
           :ensure t
           :init (ido-vertical-mode 1))))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package dired-details
  :ensure t
  :config
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install))

(use-package projectile
  :ensure t
  :commands projectile-global-mode)

(use-package dash-at-point
  :ensure t
  :bind (("s-D"     . dash-at-point)
         ("C-c e"   . dash-at-point-with-docset)))

(use-package helm
  ;; http://tuhdo.github.io/helm-intro.html#sec-31
  :ensure t
  :diminish helm-mode
  :config (progn

            (require 'helm-config)

            (use-package helm-projectile
              :ensure t
              :commands helm-projectile
              :bind ("s-p" . helm-projectile))

            (use-package helm-ag
              :ensure t
              :config
              (setq helm-ag-base-command
                    "/usr/local/bin/ag --nocolor --nogroup --ignore-case")
              (setq helm-ag-command-option "--all-text")
              (setq helm-ag-insert-at-point 'symbol))

            (setq helm-locate-command "mdfind -interpret -name %s %s"
                  helm-ff-newfile-prompt-p nil
                  helm-M-x-fuzzy-match t)
            (helm-mode)
            (helm-autoresize-mode t)
            ;; rebind tab to do persistent action
            (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
            ;; make TAB works in terminal
            (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
            ;; list actions using C-z
            (define-key helm-map (kbd "C-z")  'helm-select-action)
            (bind-key (kbd "M-x") 'helm-M-x))

  :bind (("C-c h" . helm-command-prefix)
         ("C-x b" . helm-mini)
         ("C-`" . helm-resume)
         ("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)))

(use-package smex
  :disabled t
  :ensure t
  :bind ("M-x" . smex))

;;-----------------------------------------------------------------------------
;; Locations
;;-----------------------------------------------------------------------------

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))


(setq custom-file  (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;-----------------------------------------------------------------------------
;; Paths
;;-----------------------------------------------------------------------------

(setq default-directory "~/")

(defvar kfi-local-bin (concat (getenv "HOME") "/bin") "Local execs.")

(setenv "PATH" (concat (getenv "PATH") ":" kfi-local-bin))
(setenv "LEIN_JVM_OPTS" "-Djava.awt.headless=true")

(setq exec-path (append exec-path (list kfi-local-bin) ))

;;-----------------------------------------------------------------------------
;; Packages
;;-----------------------------------------------------------------------------

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar kfi-packages
  '(
    erc-hl-nicks
    htmlize
    json-mode
    magit
    melpa-upstream-visit
    multi-term
    multiple-cursors
    clojure-mode
    clojure-mode-extra-font-locking))

(dolist (p kfi-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;-----------------------------------------------------------------------------
;; Package customizations
;;-----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/kfi/")

(defvar customized-packages
  '(
    kfi-theme
    kfi-clojure
    kfi-emacs-lisp
    kfi-erc
    kfi-functions
    kfi-html
    kfi-ibuffer
    kfi-java
    kfi-javascript
    kfi-linum
    kfi-keyboard
    kfi-magit
    kfi-multiple-cursors
    kfi-server
    kfi-shell-script
    kfi-terminal
    ))

(dolist (package customized-packages)
  (require package))

;;-----------------------------------------------------------------------------
;; Local, single machine customization:
;;-----------------------------------------------------------------------------

(defconst init-local-file "~/.emacs.d/init-local.el"
  "For customizing per device.")

(if (file-exists-p init-local-file)
    (load init-local-file))
