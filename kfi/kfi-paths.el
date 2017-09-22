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
