;;; kfi-omnibus -- small packages
;;;
;;; Commentary:
;;;
;;; Copyright (c) 2017 Keith Irwin
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published
;;; by the Free Software Foundation, either version 3 of the License,
;;; or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Provides functions to customize the theme to my liking.
;;;
;;; Code:
;;;

(use-package command-log-mode
  :ensure t)

(use-package dirtree
  :ensure t)

(use-package fullframe
  ;; https://github.com/tomterl/fullframe
  :ensure t)

(use-package dired-details
  :ensure t
  :config
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install))

(use-package ag
  :ensure t)

(use-package paredit
  :ensure t)

(use-package company
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package melpa-upstream-visit
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package olivetti
  :ensure t)

(provide 'kfi-omnibus)
;;; kfi-omnibus ends here
