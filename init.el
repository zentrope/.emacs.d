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

;;(setq use-package-verbose t)

(org-babel-load-file (concat user-emacs-directory "config.org"))

;;-----------------------------------------------------------------------------
;; EVERYTHING BELOW HERE MUST MOVE TO CONFIG.ORG
;;
;;
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
(defvar usr-local-bin "/usr/local/bin")

(setenv "PATH" (concat usr-local-bin ":" (getenv "PATH") ":" kfi-local-bin))
(setenv "LEIN_JVM_OPTS" "-Djava.awt.headless=true")

(setq exec-path (append exec-path (list kfi-local-bin) ))

;;-----------------------------------------------------------------------------
;; Packages
;;-----------------------------------------------------------------------------

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar kfi-packages
  '(
    htmlize
    json-mode
    melpa-upstream-visit
    multi-term
    multiple-cursors
    ))

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
    kfi-emacs-lisp
    kfi-html
    kfi-ibuffer
    kfi-java
    kfi-javascript
    kfi-keyboard
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


(message "Ready Player One")
