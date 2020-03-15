;;; kfi-basics --- configure basic packages
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

;;(setq use-package-verbose t)

(use-package ag
  :ensure t)

(use-package browse-kill-ring
  :ensure t
  :bind ("M-y" . browse-kill-ring))

(use-package dired
  ;; bound when in a dired buffer
  :bind ("C-c C-w C-d" . wdired-change-to-wdired-mode)
  :after dired-details
  :config
  ;;
  (dired-details-install)
  (when (string= system-type "darwin")
    (setq dired-use-ls-dired nil)))

(use-package dired-details
  :ensure t
  :config
  (setq-default dired-details-hidden-string "[…] ")
  (dired-details-install))

(use-package dockerfile-mode
  :commands dockerfile-mode
  :ensure t
  :defer t)

(use-package prog-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook '(lambda ()
                                     (paredit-mode 1)
                                     (setq indent-tabs-mode nil)
                                     (local-set-key (kbd "RET") 'newline-and-indent))))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-copy-env "JAVA_HOME")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-initialize))

(use-package fish-mode
  :commands fish-mode
  :ensure t
  :init
  (setq fish-indent-offset 2))

(use-package flycheck
  :ensure t
  :commands (flycheck-mode global-flycheck-mode)
  ;;:init
  ;; (add-hook 'after-init-hook #'global-flycheck-mode)
  )

(use-package fullframe
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package melpa-upstream-visit
  :ensure t)

(use-package multiple-cursors
  :commands multiple-cursors-mode
  :ensure t
  :config
  (setq mac-command-modifier 'super)
  :bind (("C-S-c k" . mc/edit-lines)
         ("C-M->" . mc/mark-all-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)))


(use-package olivetti
  :ensure t)

(use-package paredit
  :ensure t
  :commands paredit-mode
  :delight " ❡")

(use-package paren-face
  :ensure t
  :config
  (global-paren-face-mode 1))

(use-package ripgrep
  :ensure t
  :bind (("C-M-s-f" . projectile-ripgrep)))

(use-package sh-script
  :commands shell-script-mode
  :init
  (add-hook 'sh-mode-hook '(lambda ()
                             (setq sh-basic-offset 2))))


(provide 'kfi-basics)
;;; kfi-basics.el ends here
