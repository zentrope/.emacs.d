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
    autopair
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
    ))

(dolist (p kfi-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;-----------------------------------------------------------------------------
;; Load customizations and setups: order matters.
;;-----------------------------------------------------------------------------

(load "~/.emacs.d/configs/setup.el")
(load "~/.emacs.d/configs/accessibility.el")
(load "~/.emacs.d/configs/rainbow.el")
(load "~/.emacs.d/configs/autocomplete.el")
(load "~/.emacs.d/configs/ido.el")
(load "~/.emacs.d/configs/smex.el")
(load "~/.emacs.d/configs/clojure.el")
(load "~/.emacs.d/configs/clojurescript.el")
(load "~/.emacs.d/configs/cljsbuild.el")
(load "~/.emacs.d/configs/emacs-lisp.el")
(load "~/.emacs.d/configs/markdown.el")
(load "~/.emacs.d/configs/multiple-cursors.el")
(load "~/.emacs.d/configs/nrepl.el")
(load "~/.emacs.d/configs/css.el")
(load "~/.emacs.d/configs/javascript.el")
(load "~/.emacs.d/configs/autopair.el")
(load "~/.emacs.d/configs/terminal.el")
(load "~/.emacs.d/configs/erc.el")
(load "~/.emacs.d/configs/org.el")
(load "~/.emacs.d/configs/multiweb.el")
(load "~/.emacs.d/configs/magit.el")
(load "~/.emacs.d/configs/dired-details.el")

;;-----------------------------------------------------------------------------
;; Local, single machine customization:
;;-----------------------------------------------------------------------------

(defconst init-local-file "~/.emacs.d/init-local.el"
  "For customizing per device.")

(if (file-exists-p init-local-file)
    (load init-local-file))

;;-----------------------------------------------------------------------------
