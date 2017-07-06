;; (use-package org-plus-contrib
;;   :ensure t
;;   :pin org
;;   :init (add-hook 'org-mode-hook 'turn-on-auto-fill)
;;   :config (progn
;;             (setq
;;              org-html-doctype "html5"
;;              org-export-with-smart-quotes t
;;              org-replace-disputed-keys t
;;              org-src-fontify-natively t
;;              org-html-postamble nil)
;;             (setq org-html-head "<style>
;;                   html { font-family: helvetica, sans-serif; padding: 50px; }
;;                   table { width: 100%; border-collapse: collapse; font-size: 10pt }
;;                   p { line-height: 1.5em; }
;;                   li { line-height: 1.5em; }
;;                   tr:nth-child(odd) {background: aliceblue}
;;                   tr:nth-child(even) {background: #fff}
;;                   th { padding: 4px; font-weight: 400; border: 1px solid #d6d6d6;
;;                        background-color: #f6f6f6; text-align: left !important; }
;;                   td { padding: 4px; border: 1px solid #d8d8d8; }
;;                 </style>")))

;; (use-package org-bullets
;;   :ensure t
;;   :init
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(provide 'kfi-org)
