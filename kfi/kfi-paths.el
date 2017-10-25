;;; kfi-paths -- set up paths
;;; Commentary:
;;; Code:

(setq default-directory "~/")

;; This loads the path from my shell which, basically, means that all
;; those linter apps can work even when Emacs is launched from the
;; Dock or Spotlight or Alfred.

(require 'exec-path-from-shell)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "JAVA_HOME")
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-initialize))

(provide 'kfi-paths)
;;; kfi-paths ends here
