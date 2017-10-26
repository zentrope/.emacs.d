;;; kfi-terminal -- embedded terminal stuff
;;; Commentary:
;;; Code:

(require 'multi-term)

(defadvice term-char-mode (after term-char-mode-fixes ())
  "Causes a compile-log warning."
  ;; (set (make-local-variable 'hl-line-mode) nil)
  (set (make-local-variable 'global-hl-line-mode) nil))

(ad-activate 'term-char-mode)

(setq multi-term-program "/usr/local/bin/fish")
(set-face-attribute 'term nil :inherit 'default)
(set-face-attribute 'term nil :inherit 'default)
(set-face-attribute 'term-color-cyan nil :foreground "dodgerblue")
(set-face-attribute 'term-color-blue nil :foreground "dodgerblue")
(set-face-attribute 'term-color-black nil :foreground "gray50")
(set-face-attribute 'term-color-yellow nil :foreground "peru")

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

(defun kfi/inhibit-line-numbers ()
  "Turn off line numbers."
  (display-line-numbers-mode -1))

(defun kfi/term-allow-pasting-to-shell ()
  "Allow pasting into the shell."
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-v") 'term-paste)
  (define-key term-raw-map (kbd "s-v") 'term-paste))

(add-hook 'term-mode-hook #'kfi/inhibit-line-numbers)
(add-hook 'term-mode-hook #'kfi/term-allow-pasting-to-shell)

(provide 'kfi-terminal)
;;; kfi-terminal ends here
