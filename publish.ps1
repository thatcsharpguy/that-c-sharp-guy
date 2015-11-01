jekyll build
get-childitem .\_site -include *.svg -recurse | foreach ($_) {remove-item $_.fullname}
