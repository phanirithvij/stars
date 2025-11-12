#!/usr/bin/env bash

# TODO something far better is required, archivebox level
#
# goal is to download all starred repos (specifically https://github.com/stars/phanirithvij/lists/nixosothersdotfiles)

rg -o '\((https://github.com\/[a-zA-Z0-9_-]*\/[a-zA-Z0-9_-]*)\)' -r '$1' README.md >links.txt
for i in $(cat links.txt); do
        git clone "$i" "$(echo "$i" | cut -d'/' -f4- | sed 's/\//__/')"
done
