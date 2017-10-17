;;; kfi-clojure -- clojure
;;;
;;; License:
;;;
;;;  Copyright (c) 2017 Keith Irwin
;;;
;;;  This program is free software: you can redistribute it and/or
;;;  modify it under the terms of the GNU General Public License as
;;;  published by the Free Software Foundation, either version 3 of
;;;  the License, or (at your option) any later version.
;;;
;;;  This program is distributed in the hope that it will be useful,
;;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;;  General Public License for more details.
;;;
;;;  You should have received a copy of the GNU General Public License
;;;  along with this program.  If not, see
;;;  http://www.gnu.org/licenses/.  Provides functions to customize
;;;  the theme to my liking.
;;;
;;; Commentary:
;;; Code:

(require 'paren-face)
(global-paren-face-mode 1)

(require 'clojure-mode)
(setq clojure-indent-style nil)
(add-hook 'clojure-mode-hook 'prettify-symbols-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'cider-mode)

(require 'cider)
(setq cider-font-lock-dynamically '(macro core function var))
(setq cider-repl-use-clojure-font-lock t)
(setq cider-overlays-use-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-repl-use-pretty-printing 1)
(setq cider-cljs-lein-repl
      (concat "(do (require 'user) "
              "    (user/start-cljs)"
              "    (user/repl-cljs))"))

(provide 'kfi-clojure)
;;; kfi-clojure.el ends here
