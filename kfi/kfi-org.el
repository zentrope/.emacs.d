(require 'org)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-html-doctype "html5")
(setq org-export-with-smart-quotes t)
(setq org-replace-disputed-keys t)

(setq org-html-head
"<style type=\"text/css\">

html {
  font-family: georgia, serif;
}

#content {
  width: 700px;
  margin: 0 auto;
}

dd {
  margin-bottom: 11pt;
}

li {
  margin-bottom: 6pt; margin-top: 6pt;
}

a { color: #369; text-decoration: none; }

a:hover {
  color: darkred;
}

pre {
  background: #444;
  color: white;
  font-family: menlo, monospace;
  line-height: 1.5em; font-size: 10pt !important;
}

table { width: 100%; margin-top: 24pt; margin-bottom: 24pt;}

tr {border-bottom: 1px solid silver;}

td { text-align: left; padding: 4px; margin: 0; }

th { text-align: left !important; padding: 4px; margin: 0; }

#postamble {
  width: 700px;
  margin: 0 auto;
  margin-top: 50pt;
  border-top: 1px dotted silver;
}
</style>")

(provide 'kfi-org)
