(require 'cider)

(defun kfi/cluj-find-existing-repl (endpoint)
  (seq-find (lambda (buff)
              (with-current-buffer buff
                (when (equal endpoint nrepl-endpoint)
                  buff)))
            (cider-repl-buffers)))

(defun kfi/cluj-connect ()
  (interactive)
  (let* ((host     "localhost")
         (port     64001)
         (endpoint `(,host ,port))
         (repl     (kfi/cluj-find-existing-repl endpoint)))
    (if repl
        (switch-to-buffer repl)
      (progn
        (cider-connect host port "~cluj")
        (when-let ((buff (kfi/cluj-find-existing-repl endpoint)))
          (switch-to-buffer buff)
          (rename-buffer "cluj.repl" t))))))

(global-set-key (kbd "C-c C-k C-j") 'kfi/cluj-connect)

(provide 'kfi-cluj)
