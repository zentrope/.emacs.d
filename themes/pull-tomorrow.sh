#!/bin/bash

set -e

root="https://raw.github.com/chriskempson/tomorrow-theme/master/GNU%20Emacs/"
themes="tomorrow-night-bright-theme.el tomorrow-night-theme.el tomorrow-theme.el"

for theme in ${themes}; do
    echo "downloading ${theme}"
    wget -q -N ${root}/${theme}
done
