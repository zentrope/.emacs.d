(require 'swift-mode)


;; Seems required, for some reason, even after this:
;;   https://github.com/chrisbarrett/swift-mode/issues/68
;; indicates that it's fixed.
;;
(add-hook 'swift-mode-hook
          (lambda ()
            (setq-local tab-width 2)
            (defvar swift-indent-offset)
            (setq-local swift-indent-offset 2)))

(provide 'kfi-swift)
