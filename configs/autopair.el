(require 'autopair)

(autopair-global-mode)
(add-hook 'clojure-mode-hook #'(lambda () (autopair-mode -1)))
