;;; kfi-theme --- config
;;; Commentary:
;;; Code:

(defconst kfi/background "#101019")
(defconst kfi/font "Menlo")

(defun kfi/dark ()
  "Turn on the dark-background theme."
  (interactive)
  (set-face-attribute 'fringe nil :background kfi/background)
  (set-face-attribute 'default nil :foreground "#ccc" :background kfi/background)
  (set-face-background 'hl-line "gray13")

  (set-face-attribute 'mode-line nil :background "#292c34")

  (set-face-attribute 'mode-line nil
                      :foreground "#ccc"
                      :background "#374350"
                      :underline nil
                      :family kfi/font :height 100 :weight 'normal
                      :box '(:line-width 2 :color "#374350" :style nil))

  (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                      :background "gray15" :family kfi/font :height 100
                      :weight 'normal :italic nil
                      :box '(:line-width 2 :color "gray15" :style nil))

  (set-face-attribute 'font-lock-comment-face nil :foreground "firebrick")

  (set-face-attribute 'region nil :background "#3E4451")

  ;; Line number customization
  (set-face-attribute 'line-number nil :foreground "#555" :background kfi/background :height 100)

  ;; ERC customizations
  (when (boundp 'erc-prompt-face)
    (set-face-attribute 'erc-prompt-face nil
                        :foreground "darkorange"
                        :background kfi/background)
    (set-face-attribute 'erc-timestamp-face nil
                        :foreground "gray30"
                        :background kfi/background)))

(defun kfi/light ()
  "Turn on the light-background theme."
  (interactive)
  (set-face-attribute 'fringe nil :background "#fff")
  (set-face-attribute 'default nil :foreground "#444" :background "white")
  (set-face-background 'hl-line "gray90")

  (set-face-attribute 'mode-line nil
                      :foreground "dodgerblue"
                      :background "gray90"
                      :underline nil
                      :family kfi/font :height 100 :weight 'normal
                      :box '(:line-width 2 :color "gray90" :style nil))

  (set-face-attribute 'mode-line-inactive nil :foreground "gray60"
                      :background "#f2f2f2" :family kfi/font :height 100
                      :weight 'normal :italic nil
                      :box '(:line-width 2 :color "#f2f2f2" :style nil))

  (set-face-attribute 'region nil :background "aquamarine")

  ;; Line number customization
  (set-face-attribute 'line-number nil :foreground "#ccc"
                      :background "white" :height 100)

  ;; ERC customizations
  (when (boundp 'erc-prompt-face)
    (set-face-attribute 'erc-prompt-face nil
                        :foreground "dodgerblue" :background "white")
    (set-face-attribute 'erc-timestamp-face nil
                        :foreground "dodgerblue" :background "white")))

(when (display-graphic-p)
  (kfi/light))

(provide 'kfi-theme)
;;; kfi-theme.el ends here
