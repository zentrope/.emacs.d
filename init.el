;;-----------------------------------------------------------------------------
;; Locations
;;-----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))

(when (equal system-type 'darwin)
  (push "/usr/texbin" exec-path)
  (push "/usr/local/bin" exec-path)
  (push "~/bin" exec-path))

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

(require 'package)

;; Development
(setq package-archives
      (list '("melpa"        . "http://melpa.org/packages/")
            '("melpa-stable" . "http://stable.melpa.org/packages/")
            '("gnu"          . "http://elpa.gnu.org/packages/")
            '("org"          . "http://orgmode.org/elpa/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(clj-refactor . "melpa-stable") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar kfi-packages
  '(
    atom-one-dark-theme
    company
    dired-details
    erc-hl-nicks
    htmlize
    ido-ubiquitous
    ido-vertical-mode
    json-mode
    magit
    markdown-mode
    melpa-upstream-visit
    multi-term
    web-mode
    multiple-cursors
    paredit
    projectile
    restclient
    smex
    swift-mode
    org
    cider
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
    kfi-cider
    kfi-clojure
    kfi-css
    kfi-dired-details
    kfi-emacs-lisp
    kfi-erc
    kfi-functions
    kfi-html
    kfi-ibuffer
    kfi-ido
    kfi-java
    kfi-javascript
    kfi-linum
    kfi-keyboard
    kfi-magit
    kfi-markdown
    kfi-multiple-cursors
    kfi-org
    kfi-paredit
    kfi-projectile
    kfi-server
    kfi-shell-script
    kfi-smex
    kfi-swift
    kfi-terminal
    kfi-theme
    kfi-webmode
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

;;-----------------------------------------------------------------------------
;; Ugh
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b2d6d3519462edc6373c02ea7c871fa7653f84e5dd6dba582b116ddf2c8c9af1" default)))
 '(indent-tabs-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
