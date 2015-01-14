(require 'jabber)

(setq jabber-account-list '(("keith.irwin@gmail.com"
                             (:network-server . "talk.google.com")
                             (:port . 443)
                             (:connection-type . ssl))))

(setq starttls-use-gnutls t
      starttls-gnutls-program "gnutls-cli"
      starttls-extra-arguments '("--starttls" "--insecure"))

(provide 'kfi-jabber)
