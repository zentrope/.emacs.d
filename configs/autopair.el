(require 'autopair)

(autopair-global-mode)

;; paredit is much better
(add-hook 'clojure-mode-hook #'(lambda () (autopair-mode -1)))

;; autopair really screws up ansi-term
(add-hook 'term-mode-hook #'(lambda () (autopair-mode -1)))
