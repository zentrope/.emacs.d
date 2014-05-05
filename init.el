;;-----------------------------------------------------------------------------
;; Locations
;;-----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/backups")))

(when (equal system-type 'darwin)
  (push "/usr/texbin" exec-path)
  (push "/usr/local/bin" exec-path))

;;-----------------------------------------------------------------------------
;; Paths
;;-----------------------------------------------------------------------------

(setq default-directory "~/")

(defvar kfi-local-bin (concat (getenv "HOME") "/bin") "Local execs.")

(setenv "PATH" (concat (getenv "PATH") ":" kfi-local-bin))
(setq exec-path (append exec-path (list kfi-local-bin) ))

;;-----------------------------------------------------------------------------
;; Packages
;;-----------------------------------------------------------------------------

(require 'package)

;; Development
(setq package-archives
      (list '("melpa" . "http://melpa.milkbox.net/packages/")))

;; Stable
;; (setq package-archives
;;       (list '("melpa" . "http://hiddencameras.milkbox.net/packages/")))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar kfi-packages
  '(
    ample-theme
    base16-theme
    cider
    cljsbuild-mode
    clojure-mode
    dired-details
    erc-hl-nicks
    flatui-theme
    htmlize
    ido-ubiquitous
    ido-vertical-mode
    magit
    markdown-mode
    melpa-upstream-visit
    multi-term
    multi-web-mode
    multiple-cursors
    paredit
    parenface
    powerline
    smex
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
    kfi-keyboard
    kfi-magit
    kfi-markdown
    kfi-multiple-cursors
    kfi-multiweb
    kfi-org
    kfi-paredit
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
