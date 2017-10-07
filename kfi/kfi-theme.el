;;; kfi-theme -- colors
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

(defconst kfi/background "#000000")
(defconst kfi/line-face hl-line-face)

(defun kfi/dark ()
  "Turn on the dark-background theme."
  (interactive)
  (set-face-attribute 'fringe nil :background kfi/background)
  (set-face-attribute 'default nil :foreground "#ccc" :background kfi/background)
  (set-face-background kfi/line-face "gray15")

  (set-face-attribute 'mode-line nil :background "#292c34")

  (set-face-attribute 'mode-line nil
                      :foreground "#ccc"
                      :background "#374350"
                      :underline nil
                      :family "Menlo" :height 100 :weight 'normal
                      :box '(:line-width 2 :color "#374350" :style nil))

  (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                      :background "gray15" :family "Menlo" :height 100
                      :weight 'normal :italic nil
                      :box '(:line-width 2 :color "gray15" :style nil))

  (set-face-attribute 'font-lock-comment-face nil :foreground "firebrick")

  (set-face-attribute 'region nil :background "#3E4451")

  ;; Line number customization
  (set-face-attribute 'line-number nil :foreground "#555" :background "black" :height 100)

  ;; ERC customizations
  (set-face-attribute 'erc-prompt-face nil
                      :foreground "darkorange"
                      :background kfi/background)

  (set-face-attribute 'erc-timestamp-face nil
                      :foreground "gray30"
                      :background kfi/background))

(defun kfi/light ()
  "Turn on the light-background theme."
  (interactive)
  (set-face-attribute 'fringe nil :background "#fff")
  (set-face-attribute 'default nil :foreground "#444" :background "white")
  (set-face-background kfi/line-face "gray90")

  (set-face-attribute 'mode-line nil
                      :foreground "dodgerblue"
                      :background "gray90"
                      :underline nil
                      :family "Menlo" :height 100 :weight 'normal
                      :box '(:line-width 2 :color "gray90" :style nil))

  (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                      :background "#f2f2f2" :family "Menlo" :height 100
                      :weight 'normal :italic nil
                      :box '(:line-width 2 :color "#f2f2f2" :style nil))

  (set-face-attribute 'region nil :background "aquamarine")

  ;; Line number customization
  (set-face-attribute 'line-number nil :foreground "#ccc" :background "white" :height 100)

  ;; ERC customizations
  (set-face-attribute 'erc-prompt-face nil
                      :foreground "dodgerblue" :background "white")
  (set-face-attribute 'erc-timestamp-face nil
                      :foreground "dodgerblue" :background "white"))

(when window-system
  (kfi/light))

(provide 'kfi-theme)
;;; kfi-theme ends here
