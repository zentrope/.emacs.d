;;-----------------------------------------------------------------------------
;; Bootstrap Packaging
;;-----------------------------------------------------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar kfi-packages
  '(
    ac-nrepl
    auto-complete
    clojure-mode
    dired-details
    erc-hl-nicks
    ido-ubiquitous
    magit
    multiple-cursors
    markdown-mode
    melpa
    multi-term
    nrepl
    paredit
    parenface
    smex
    multi-web-mode
    clojurescript-mode
    cljsbuild-mode
    diff-hl
    smartparens
    ))

(dolist (p kfi-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;-----------------------------------------------------------------------------
;; Load customizations and setups: order matters.
;;-----------------------------------------------------------------------------

(byte-recompile-directory (expand-file-name "~/.emacs.d/configs/") 0)

(load "~/.emacs.d/configs/setup")
(load "~/.emacs.d/configs/accessibility")
(load "~/.emacs.d/configs/smartparens")
(load "~/.emacs.d/configs/autocomplete")
(load "~/.emacs.d/configs/ido")
(load "~/.emacs.d/configs/smex")
(load "~/.emacs.d/configs/clojure")
(load "~/.emacs.d/configs/clojurescript")
(load "~/.emacs.d/configs/cljsbuild")
(load "~/.emacs.d/configs/emacs-lisp")
(load "~/.emacs.d/configs/markdown")
(load "~/.emacs.d/configs/multiple-cursors")
(load "~/.emacs.d/configs/nrepl")
(load "~/.emacs.d/configs/css")
(load "~/.emacs.d/configs/javascript")
(load "~/.emacs.d/configs/terminal")
(load "~/.emacs.d/configs/erc")
(load "~/.emacs.d/configs/org")
(load "~/.emacs.d/configs/multiweb")
(load "~/.emacs.d/configs/magit.el")
(load "~/.emacs.d/configs/dired-details")
(load "~/.emacs.d/configs/diff-hl")

;;-----------------------------------------------------------------------------
;; Local, single machine customization:
;;-----------------------------------------------------------------------------

(defconst init-local-file "~/.emacs.d/init-local.el"
  "For customizing per device.")

(if (file-exists-p init-local-file)
    (load init-local-file))

;;-----------------------------------------------------------------------------
