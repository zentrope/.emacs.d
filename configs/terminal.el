;; terminal.el

(require 'multi-term)

;; Turn off current-line-highlighting and auto-pair.
(defadvice term-char-mode (after term-char-mode-fixes ())
  (autopair-mode -1)
  (set (make-local-variable 'hl-line-mode) nil)
  (set (make-local-variable 'global-hl-line-mode) nil))

(ad-activate 'term-char-mode)

(setq multi-term-program "/bin/bash")
;; (set-face-attribute 'term nil :background "black")
;; (set-face-attribute 'term nil :foreground "#999999")

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


;; bold="\[\e[01;37m\]"
;; off="\[\e[00m\]"

;; green="\[\e[0;32m\]"
;; cyan="\[\e[0;36m\]"
;; blueish="\[\e[1;38;5;75m\]"

;; wdir="${blueish}\w${off}"

;; function gitb {
;;   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
;;   echo " ("${ref#refs/heads/}")"
;; }

;; b1="${lblue}(${lgray}"
;; b2="${lblue})${off}"

;; if [ "${INSIDE_EMACS}" != "" ]; then
;;     export TERM="xterm-256color"
;;     echo "INSIDE EMACS"
;; fi

;; PS1=" ${cyan}eλ${off} ${bold}\w${off}${green}\$(gitb)${off} > "
