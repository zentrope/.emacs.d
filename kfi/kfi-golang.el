;;
;; Copyright (c) 2017 Keith Irwin
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(setq gofmt-command "goimports")
(defun kfi/go-mode-hook ()
  (local-set-key (kbd "C-c C-r" 'go-remove-unused-imports))
  (local-set-key (kbd "C-c i" 'go-goto-imports)))
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook #'kfi/go-mode-hook)

(provide 'kfi-golang)
