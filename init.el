;;-----------------------------------------------------------------------------
;; Locations
;;-----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))

(when (equal system-type 'darwin)
  (push "/usr/texbin" exec-path)
  (push "/usr/local/bin" exec-path))

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

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar kfi-packages
  '(
    cljsbuild-mode
    company
    dired-details
    erc-hl-nicks
    htmlize
    ido-ubiquitous
    json-mode
    magit
    markdown-mode
    melpa-upstream-visit
    multi-term
    multi-web-mode
    multiple-cursors
    paredit
    restclient
    smex
    org
    cider
    clojure-mode
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
    kfi-cider
    kfi-cljsbuild
    kfi-clojure
    kfi-css
    kfi-dired-details
    kfi-emacs-lisp
    kfi-erc
    kfi-functions
    kfi-html
    kfi-ido
    kfi-java
    kfi-javascript
    kfi-lisp
    kfi-keyboard
    kfi-magit
    kfi-markdown
    kfi-multiple-cursors
    kfi-multiweb
    kfi-org
    kfi-paredit
    kfi-server
    kfi-shell-script
    kfi-smex
    kfi-terminal
    kfi-theme
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
