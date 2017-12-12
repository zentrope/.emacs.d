;;; kfi-functions -- function omnibus
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

(defun kfi/unwrap-line ()
  "Remove newlines until end-of-paragram."
  (interactive)
  (let ((start (point))
        (end (copy-marker (or (search-forward "\n\n" nil t)
                              (point-max))))
        (fill-column (point-max)))
    (fill-region start end)
    (goto-char end)
    (newline)
    (goto-char start)))

(defun kfi/set-frame-width (arg)
  "Set the width of the frame to ARG."
  (interactive "nFrame width: ")
  (set-frame-width (selected-frame) arg))

(defun kfi/dw ()
  "Set frame to double-wide."
  (interactive)
  (kfi/set-frame-width 180))

(defun kfi/sw ()
  "Set frame to single-wide."
  (interactive)
  (kfi/set-frame-width 90))

(defun kfi/set-frame-height (arg)
  "Set frame height to ARG."
  (interactive "nFrame height: ")
  (set-frame-height (selected-frame) arg))

(defun kfi/set-frame-dimensions (w h)
  "Set frame dimensions to W and H."
  (interactive "nFrame width: \nnFrame height: ")
  (set-frame-width (selected-frame) w)
  (set-frame-height (selected-frame) h))

(defun kfi/back-window ()
  "Go back to previously visited window."
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") 'kfi/back-window)

(defun kfi/open-this ()
  "Open the buffer using MacOS defaults."
  (interactive)
  (shell-command (concat "open '" (buffer-file-name) "'")))

(global-set-key (kbd "C-c C-x o") 'kfi/open-this)
(global-set-key (kbd "C-c C-x w") 'kfi/dw)
(global-set-key (kbd "C-c C-x s") 'kfi/sw)

(defun kfi/set-font-size (size)
  "Set the font SIZE."
  (interactive "nNew size: ")
  (set-face-attribute 'default nil :height size))

(defun kfi/font-size-up ()
  "Shift font size up by 10 units."
  (interactive)
  (kfi/set-font-size (+ (face-attribute 'default :height) 10)))

(defun kfi/font-size-down ()
  "Shift font size down by 10 units."
  (interactive)
  (kfi/set-font-size (- (face-attribute 'default :height) 10)))

(defun kfi/lorem ()
  "Output a bunch of lorem ipsum text."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun kfi/sort-words (reverse beg end)
  "Sort region words REVERSE if negative from BEG to END.
Prefixed with negative \\[universal-argument], sorts in reverse.
The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.  See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defun kfi/transparency-on ()
  "Turn on frame transparency."
  (interactive)
  (set-frame-parameter nil 'alpha '(95 95))
  (add-to-list 'default-frame-alist '(alpha 95 95)))

(defun kfi/transparency-no ()
  "Turn off frame transparency."
  (interactive)
  (set-frame-parameter nil 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha 100 100)))


;; (setq-default line-spacing 5)

(defun kfi/write-mode ()
  "Set special prose writing mode."
  (interactive)
  (display-line-numbers-mode -1)
  (global-hl-line-mode 0)
  (olivetti-mode 1)
  (flyspell-mode 1)
  (flyspell-buffer))

(defun kfi/unwrite-mode ()
  "Unset special prose writing mode."
  (interactive)
  (global-hl-line-mode 1)
  (olivetti-mode 0)
  (flyspell-mode 0)
  (display-line-numbers-mode 1))

;; Convenience command to jump to the init file.

(defun kfi/edit-init-el ()
  "Visit the init.el file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(provide 'kfi-functions)
;;; kfi-functions.el ends here
