;;-----------------------------------------------------------------------------
;; Boostrap Packaging
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
    ido-ubiquitous
    magit
    mark-multiple
    markdown-mode
    melpa
    nrepl
    paredit
    parenface
    smex

    ;; themes
    molokai-theme
    solarized-theme
    twilight-anti-bright-theme
    twilight-bright-theme
    twilight-theme
    underwater-theme
    ))

(dolist (p kfi-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;-----------------------------------------------------------------------------
;; Load customizations and setups: order matters.
;;-----------------------------------------------------------------------------

(load "~/.emacs.d/configs/setup.el")
(load "~/.emacs.d/configs/accessibility.el")
(load "~/.emacs.d/configs/autocomplete.el")
(load "~/.emacs.d/configs/ido.el")
(load "~/.emacs.d/configs/smex.el")
(load "~/.emacs.d/configs/clojure.el")
(load "~/.emacs.d/configs/emacs-lisp.el")
(load "~/.emacs.d/configs/markdown.el")
(load "~/.emacs.d/configs/mark-multiple.el")
(load "~/.emacs.d/configs/nrepl.el")
(load "~/.emacs.d/configs/css.el")
(load "~/.emacs.d/configs/javascript.el")
(load "~/.emacs.d/configs/autopair.el")
(load "~/.emacs.d/configs/terminal.el")
(load "~/.emacs.d/configs/erc.el")
(load "~/.emacs.d/configs/org.el")

;;-----------------------------------------------------------------------------