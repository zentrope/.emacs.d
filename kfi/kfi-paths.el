(setq default-directory "~/")

(defvar kfi-local-bin (concat (getenv "HOME") "/bin") "Local execs.")
(defvar usr-local-bin "/usr/local/bin")
(defvar tex-bin "/Library/TeX/texbin")
(defvar go-path (concat (getenv "HOME") "/workspace/go/bin") "Go workspace.")

(setenv "PATH" (concat usr-local-bin ":" (getenv "PATH") ":" kfi-local-bin ":" go-path ":" tex-bin))
(setenv "LEIN_JVM_OPTS" "-Djava.awt.headless=true")

(setq exec-path (append exec-path (list kfi-local-bin usr-local-bin go-path tex-bin)))

(provide 'kfi-paths)
