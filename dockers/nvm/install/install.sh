#!/bin/bash

version="$1"
prefix="$2"

if [ -z "$version" ]; then
    echo "Error: version not specified"
    exit 1
fi

if [ -z "$prefix" ]; then
    prefix="/usr/local"
fi

cd ./saved-versions
[ $? -ne 0 ] && exit 1

dest_folder="${prefix}/lib/nvm-${version}"

if [ ! -d "$dest_folder" ]; then
    mkdir -p "$dest_folder"
    [ $? -ne 0 ] && exit 1
fi

tar -xzf "${version}.tar.gz" -C "$dest_folder" --strip-components=1
[ $? -ne 0 ] && exit 1

if [ -f "${prefix}/bin/nvm" ]; then
    echo "Error: NVM already installed"
    exit 1
fi

echo "#!/bin/bash
source $dest_folder/nvm.sh
[ \$? -ne 0 ] && exit 1
nvm \"\$@\"
exit \$?
"   > "${prefix}/bin/nvm"
[ $? -ne 0 ] && exit 1

chmod +x "${prefix}/bin/nvm"
[ $? -ne 0 ] && exit 1

exit 0