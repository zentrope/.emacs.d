;; kfi-terminal.el

(require 'multi-term)

;; Turn off stuff that only makes sense in a regular buffer.
(defadvice term-char-mode (after term-char-mode-fixes ())
  (set (make-local-variable 'hl-line-mode) nil)
  (set (make-local-variable 'global-hl-line-mode) nil))

(ad-activate 'term-char-mode)

(setq multi-term-program "/bin/bash")
(set-face-attribute 'term nil :background "#212021")
(set-face-attribute 'term nil :foreground "#aaaaaa")
(set-face-attribute 'term-color-cyan nil :foreground "dodgerblue")
(set-face-attribute 'term-color-black nil :foreground "gray50")
(set-face-attribute 'term-color-yellow nil :foreground "sienna")

;; (when (string= (face-attribute 'default :background) "White")
;;   (set-face-attribute 'term nil :foreground "#444444" :background "white")
;;   (set-face-attribute 'term-color-white nil :foreground "black"))

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; Allow pasting text to be sent to the underlying shell process.
(add-hook
 'term-mode-hook
 (lambda ()
   (define-key term-raw-map (kbd "C-y") 'term-paste)
   (define-key term-raw-map (kbd "C-v") 'term-paste)
   (define-key term-raw-map (kbd "s-v") 'term-paste)))

(provide 'kfi-terminal)
