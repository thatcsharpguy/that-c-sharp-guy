jekyll build
get-childitem .\_site -include *.svg -recurse | foreach ($_) {remove-item $_.fullname}
get-childitem .\_site -include *.pxm -recurse | foreach ($_) {remove-item $_.fullname}
get-childitem .\_site -include *.sketch -recurse | foreach ($_) {remove-item $_.fullname}

