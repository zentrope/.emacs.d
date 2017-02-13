;;
;;

(use-package auctex-latexmk
  :ensure t
  :config
  (require 'tex)

  (add-hook 'LaTeX-mode-hook (lambda ()
                                 (set-face-attribute 'font-latex-sectioning-2-face nil :inherit 'default :weight 'bold)
                                 (set-face-attribute 'font-latex-sectioning-3-face nil :inherit 'font-latex-sectioning-2-face)))

  )

(provide 'kfi-latex)
