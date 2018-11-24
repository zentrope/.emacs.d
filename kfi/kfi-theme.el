;;; kfi-theme --- theme related functions
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
;;
;; This isn't a proper Emacs theme, just customizations of the
;; defaults.
;;
;;; Code:

(defun kfi/set-font (name weight)
  "Set a font to NAME and its WEIGHT."
  (set-face-attribute 'default nil :family name :weight weight))

(defun kfi/heavy-font ()
  "Change to a heavy font."
  (interactive)
  (kfi/set-font "Monaco" 'normal))

(defun kfi/normal-font ()
  "Change to a normal font."
  (interactive)
  (kfi/set-font "Menlo" 'normal))

(defun kfi/thin-font ()
  "Change to a thin font."
  (interactive)
  (kfi/set-font "Input Mono Narrow" 'thin))

;; Good for light theme.
(defun kfi/input-font ()
  "Change to a input mono font."
  (interactive)
  (kfi/set-font "Input Mono" 'normal))

(defconst kfi/dark-bg "#1a1c24")
(defconst kfi/dark-hl "#252732")
(defconst kfi/font    "Menlo")

(defun kfi/dark ()
  "Turn on the dark-background theme."
  (interactive)
  (set-face-attribute 'fringe nil
                      :background kfi/dark-bg)

  (set-face-attribute 'default nil
                      :foreground "#cccccc"
                      :background kfi/dark-bg)

  (set-face-background 'hl-line kfi/dark-hl)

  (set-face-attribute 'mode-line nil
                      :background "#292c34")

  (set-face-attribute 'mode-line nil
                      :foreground "#ccc"
                      :background "#374350"
                      :underline nil
                      :family kfi/font
                      :height 120
                      :weight 'normal
                      :box nil)

  (set-face-attribute 'mode-line-inactive nil
                      :foreground "gray60"
                      :background "gray15"
                      :family kfi/font
                      :height 120
                      :weight 'normal
                      :italic nil
                      :box nil)

  (set-face-attribute 'font-lock-string-face nil
                      :foreground "#b0c2e7")

  (set-face-attribute 'font-lock-comment-face nil
                      :foreground "#777"
                      :slant 'italic)

  (set-face-attribute 'region nil
                      :background "#3E4451")

  ;; Line number customization
  (set-face-attribute 'line-number nil
                      :foreground "#555"
                      :background kfi/dark-bg
                      :height 100)

  ;; ERC customizations
  (set-face-attribute 'erc-prompt-face nil
                      :foreground "darkorange"
                      :background kfi/dark-bg)

  (set-face-attribute 'erc-timestamp-face nil
                      :foreground "gray30"
                      :background kfi/dark-bg)
  ;;
  )

(defun kfi/light ()
  "Turn on the light-background theme."
  (interactive)
  (set-face-attribute 'fringe nil :background "#fff")
  (set-face-attribute 'default nil :foreground "black" :background "white")
  (set-face-background 'hl-line "gray90")

  (set-face-attribute 'font-lock-string-face nil :foreground "#666")
  (set-face-attribute 'font-lock-comment-face nil :foreground "#777" :slant 'italic)

  (set-face-attribute 'mode-line nil
                      :foreground "dodgerblue"
                      :background "gray90"
                      :underline nil
                      :family kfi/font :height 120 :weight 'normal
                      :box nil)

  (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                      :background "#f2f2f2" :family kfi/font :height 120
                      :weight 'normal :italic nil
                      :box nil)

  (set-face-attribute 'region nil :background "aquamarine")

  ;; Line number customization
  (set-face-attribute 'line-number nil :foreground "#ccc"
                      :background "white" :height 100)

  ;; ERC customizations
  (set-face-attribute 'erc-prompt-face nil
                      :foreground "dodgerblue" :background "white")
  (set-face-attribute 'erc-timestamp-face nil
                      :foreground "dodgerblue" :background "white")
  ;;
  )

(provide 'kfi-theme)
;;; kfi-theme.el ends here
