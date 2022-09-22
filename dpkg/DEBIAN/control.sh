cat <<EOT > control
Package: internship
Version: $1
Section: base
Architecture: all
Priority: optional
Depends: python3, gcc, nginx, build-essential,python3-dev, build-essential, libssl-dev, libffi-dev, libxml2-dev, libxslt1-dev, zlib1g-dev, python3-pip
Maintainer: Jarosalv Hajek
Description: INTERNSHIP WEB APP
EOT


