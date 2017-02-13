;;
;;

(use-package auctex-latexmk
  :ensure t
  :config
  (require 'tex)

  (defun kfi/latex-font-fixes ()
    (set-face-attribute 'font-latex-sectioning-2-face nil :inherit 'default)
    (set-face-attribute 'font-latex-sectioning-3-face nil :inherit 'default))

  (add-hook 'LaTeX-mode-hook 'kfi/latex-font-fixes)
  ;;
  )

(provide 'kfi-latex)
