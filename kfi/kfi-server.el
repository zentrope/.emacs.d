(require 'server)

(if (not (server-running-p))
    (server-start))

(provide 'kfi-server)
