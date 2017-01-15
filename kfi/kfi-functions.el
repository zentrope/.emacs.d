;;-----------------------------------------------------------------------------
;; KFI Functions
;;-----------------------------------------------------------------------------

(defun kfi-unwrap-line ()
  "Remove all newlines until we get to two consecutive ones.
      Or until we reach the end of the buffer.
      Great for unwrapping quotes before sending them on IRC."
  (interactive)
  (let ((start (point))
        (end (copy-marker (or (search-forward "\n\n" nil t)
                              (point-max))))
        (fill-column (point-max)))
    (fill-region start end)
    (goto-char end)
    (newline)
    (goto-char start)))

(defun kfi-set-frame-width (arg)
  (interactive "nFrame width: ")
  (set-frame-width (selected-frame) arg))

(defun kfi-dw ()
  "Double-wide with C-c C-x w."
  (interactive)
  (kfi-set-frame-width 180))

(defun kfi-sw ()
  "Single wide with C-c C-x s."
  (interactive)
  (kfi-set-frame-width 90))

(defun kfi-set-frame-height (arg)
  (interactive "nFrame height: ")
  (set-frame-height (selected-frame) arg))

(defun kfi-set-frame-dimensions (w h)
  (interactive "nFrame width: \nnFrame height: ")
  (set-frame-width (selected-frame) w)
  (set-frame-height (selected-frame) h))

(defun kfi-back-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") 'kfi-back-window)

(defun kfi-open-this ()
  (interactive)
  (shell-command (concat "open '" (buffer-name) "'")))

(global-set-key (kbd "C-c C-x o") 'kfi-open-this)
(global-set-key (kbd "C-c C-x w") 'kfi-dw)
(global-set-key (kbd "C-c C-x s") 'kfi-sw)

(defun kfi-set-font-size (size)
  (interactive "nNew size: ")
  (set-face-attribute 'default nil :height size))

(defun kfi-font-size-up ()
  (interactive)
  (kfi-set-font-size (+ (face-attribute 'default :height) 10)))

(defun kfi-font-size-down ()
  (interactive)
  (kfi-set-font-size (- (face-attribute 'default :height) 10)))

(defun kfi-lorem ()
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun kfi-sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
           Prefixed with negative \\[universal-argument], sorts in reverse.

           The variable `sort-fold-case' determines whether alphabetic case
           affects the sort order.

           See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defun kfi-transparency ()
  (interactive)
  (set-frame-parameter nil 'alpha '(95 95))
  (add-to-list 'default-frame-alist '(alpha 95 95)))

(defun kfi-transparency-no ()
  (interactive)
  (set-frame-parameter nil 'alpha '(100 100))
  (add-to-list 'default-frame-alist '(alpha 100 100)))

(provide 'kfi-functions)
