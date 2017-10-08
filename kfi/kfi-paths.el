;;; kfi-paths -- set up paths
;;;
;;; Commentary:
;;;
;;; Copyright (c) 2017 Keith Irwin
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published
;;; by the Free Software Foundation, either version 3 of the License,
;;; or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;; Provides functions to customize the theme to my liking.
;;;
;;; Code:
;;;

(setq default-directory "~/")

(defvar kfi-local-bin (concat (getenv "HOME") "/bin") "Local execs.")
(defvar usr-local-bin "/usr/local/bin")
(defvar tex-bin "/Library/TeX/texbin")
(defvar go-path (concat (getenv "HOME") "/workspace/golang/bin") "Go workspace.")
(defvar go-path2 (concat (getenv "HOME") "/workspace/go/bin") "Go workspace.")
(defvar go-path3 (concat (getenv "HOME") "/Go/bin") "Go workspace.")

(setenv "PATH" (concat usr-local-bin ":" (getenv "PATH") ":" kfi-local-bin ":" go-path ":" go-path2 ":" tex-bin ":" go-path3))
(setenv "LEIN_JVM_OPTS" "-Djava.awt.headless=true")

(setq exec-path (append exec-path (list kfi-local-bin usr-local-bin go-path go-path2 go-path3 tex-bin)))

(provide 'kfi-paths)
;;; kfi-paths ends here
