;;-----------------------------------------------------------------------------
;; And so it begins
;;-----------------------------------------------------------------------------

(when window-system
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(require 'package)

;; Development
(setq package-archives
      (list '("melpa"        . "https://melpa.org/packages/")
            '("melpa-stable" . "https://stable.melpa.org/packages/")
            '("gnu"          . "http://elpa.gnu.org/packages/")
            '("org"          . "http://orgmode.org/elpa/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless package-archive-contents
  (package-refresh-contents))

;; https://github.com/jwiegley/use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)


;;(setq use-package-verbose t)

;;=============================================================================

(add-to-list 'load-path "~/.emacs.d/kfi/")

;;-----------------------------------------------------------------------------
;; buffer backups
;;-----------------------------------------------------------------------------

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq backup-inhibited t)
(setq auto-save-default nil)

;;-----------------------------------------------------------------------------
;; executable environment
;;-----------------------------------------------------------------------------

(setq default-directory "~/")

(defvar kfi-local-bin (concat (getenv "HOME") "/bin") "Local execs.")
(defvar usr-local-bin "/usr/local/bin")
(defvar tex-bin "/Library/TeX/texbin")
(defvar go-path (concat (getenv "HOME") "/workspace/go/bin") "Go workspace.")

(setenv "PATH" (concat usr-local-bin ":" (getenv "PATH") ":" kfi-local-bin ":" go-path ":" tex-bin))
(setenv "LEIN_JVM_OPTS" "-Djava.awt.headless=true")

(setq exec-path (append exec-path (list kfi-local-bin usr-local-bin go-path tex-bin)))

;;-----------------------------------------------------------------------------

(require 'kfi-omnibus)

(require 'kfi-clojure)
(require 'kfi-functions)
(require 'kfi-fuzzy)
(require 'kfi-golang)
(require 'kfi-irc)
(require 'kfi-magit)
(require 'kfi-org)
(require 'kfi-projectile)
(require 'kfi-snippets)
(require 'kfi-terminal)
(require 'kfi-web)

;;=============================================================================

(org-babel-load-file (concat user-emacs-directory "config.org"))

;;=============================================================================
