(require 'kfi-globals)

(use-package multi-term
  :ensure t
  :config
  ;; Turn off yas-snippets tab-complete when in a terminal
  (defun kfi/restore-tab (f &rest args)
    (apply f args)
    (yas-minor-mode -1))

  (advice-add 'multi-term :around #'kfi/restore-tab)

  (defadvice term-char-mode (after term-char-mode-fixes ())
    ;; Causes a compile-log warning. Do I even need this any more?
    ;; (set (make-local-variable 'hl-line-mode) nil)
    (set (make-local-variable 'global-hl-line-mode) nil))

  (ad-activate 'term-char-mode)

  (setq multi-term-program "/bin/bash")
  (set-face-attribute 'term nil :inherit 'default ;;:background kfi/background
                      )
  (set-face-attribute 'term nil :inherit 'default ;; :foreground "#aaaaaa"
                      )
  (set-face-attribute 'term-color-cyan nil :foreground "dodgerblue")
  (set-face-attribute 'term-color-black nil :foreground "gray50")
  (set-face-attribute 'term-color-yellow nil :foreground "peru")

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
     (define-key term-raw-map (kbd "s-v") 'term-paste))))

(provide 'kfi-terminal)
