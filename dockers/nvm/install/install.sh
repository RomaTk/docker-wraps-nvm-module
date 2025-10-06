#!/bin/bash

version=$1

cd ./saved-versions
[ $? -ne 0 ] && exit 1

dest_folder="/usr/local/nvm-${version}"

if [ ! -d "$dest_folder" ]; then
    mkdir -p "$dest_folder"
    [ $? -ne 0 ] && exit 1
fi

tar -xzf "${version}.tar.gz" -C "$dest_folder" --strip-components=1
[ $? -ne 0 ] && exit 1

if [ -f "/bin/nvm" ]; then
    echo "Error: NVM already installed"
    exit 1
fi

echo "#!/bin/bash
source $dest_folder/nvm.sh
[ \$? -ne 0 ] && exit 1
nvm \"\$@\"
exit \$?
"   > /bin/nvm
[ $? -ne 0 ] && exit 1

chmod +x /bin/nvm
[ $? -ne 0 ] && exit 1

exit 0