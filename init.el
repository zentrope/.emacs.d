;;; init.el --- emacs configuration
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
            '("gnu"          . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(add-to-list 'load-path "~/.emacs.d/kfi/")

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq backup-inhibited t)
(setq auto-save-default nil)

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
