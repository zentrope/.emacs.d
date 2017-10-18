;;; kfi-omnibus -- small packages
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

(eval-after-load 'dired
  '(progn
     (when (string= system-type "darwin")
       (setq dired-use-ls-dired nil))
     (require 'dired-details)
     (setq-default dired-details-hidden-string "--- ")
     (dired-details-install)))

(provide 'kfi-omnibus)
;;; kfi-omnibus ends here
