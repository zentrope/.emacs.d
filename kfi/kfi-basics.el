;;; kfi-basics --- configure basic packages
;;;
;;
;; Copyright © 2017-present Keith Irwin
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;; Code:

(use-package paren-face
  :config
  (global-paren-face-mode 1))

(use-package cider
  :commands cider-mode
  :ensure t
  :delight "cidr"
  :config
  (setq cider-font-lock-dynamically '(macro core function var))
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-overlays-use-font-lock t)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook 'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (setq cider-repl-use-pretty-printing 1))

(use-package clojure-mode-extra-font-locking
  :ensure t)

(use-package clojure-mode
  :commands clojure-mode
  :ensure t
  :delight "clj"
  :config
  (add-hook 'clojure-mode-hook 'prettify-symbols-mode)
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'cider-mode)
  (setq clojure-indent-style nil))

(use-package paredit
  :commands paredit-mode
  :delight "pe")

(use-package multiple-cursors
  :commands multiple-cursors-mode
  :ensure t
  :config
  (setq mac-command-modifier 'super)
  :bind (("C-S-c k" . mc/edit-lines)
         ("C-M->" . mc/mark-all-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)))

(use-package cc-mode
  :config
  (add-hook 'java-mode-hook (lambda ()
                              (setq c-basic-offset 2)
                              (setq tab-width 2)
                              (setq indent-tabs-mode nil))))

(use-package dockerfile-mode
  :commands dockerfile-mode
  :ensure t)

(use-package yaml-mode
  :commands yaml-mode
  :ensure t)

(use-package fish-mode
  :commands fish-mode
  :ensure t)

(provide 'kfi-basics)
;;; kfi-basics.el ends here
