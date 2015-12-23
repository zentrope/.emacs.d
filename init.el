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

(when (not package-archive-contents)
  (package-refresh-contents))

;;(setq use-package-verbose t)

(org-babel-load-file (concat user-emacs-directory "config.org"))
