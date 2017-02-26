#!/bin/bash
BIN_DIR=$HOME/.local/bin

if [[ -f $BIN_DIR/composer ]]; then
	echo "Composer already downloaded"
	exit 0
fi

echo "Downloading Composer..."
wget --quiet -O $BIN_DIR/composer https://getcomposer.org/composer.phar
chmod +x $BIN_DIR/composer
