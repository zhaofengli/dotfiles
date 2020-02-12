#!/bin/bash
# I don't want to distribute binaries in the repo,
# so here's the solution

BIN_DIR=$HOME/.local/bin
HUB_RELEASE=2.14.1
HUB_PLATFORM="unknown"

if [[ -f $BIN_DIR/hub && $($BIN_DIR/hub --version | tail -1 | sed 's/hub version //') == $HUB_RELEASE ]]; then
	echo "hub already downloaded"
	exit 0
fi

echo "Downloading hub..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	HUB_PLATFORM="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	HUB_PLATFORM="darwin"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
	HUB_PLATFORM="freebsd"
fi

if [[ $(uname -m) == "arm"* ]]; then
	HUB_PLATFORM=$HUB_PLATFORM"-arm"
elif [[ $(uname -m) == "x86_64" ]]; then
	HUB_PLATFORM=$HUB_PLATFORM"-amd64"
else
	HUB_PLATFORM=$HUB_PLATFORM"-386"
fi

HUB_NAME=hub-$HUB_PLATFORM-$HUB_RELEASE
HUB_URL=https://github.com/github/hub/releases/download/v$HUB_RELEASE/$HUB_NAME.tgz
wget --quiet -O - "$HUB_URL" | tar xzf - --strip-components=2 -C $BIN_DIR $HUB_NAME/bin/hub

