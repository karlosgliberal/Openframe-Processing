#!/bin/bash
#
# Be VERY Careful. This script may be executed with admin privileges.

echo "Installing processing..."

if ! [ -z "$TRAVIS" ]; then
    echo "TRAVIS env, don't install"
    exit 0
fi

os=$(uname)
arq=$(uname -m)

# does glslViewer already exist?
if hash processing-java 2>/dev/null; then
    echo "processing-java already installed."
    exit 0
fi

if [ $os == "Linux" ]; then

    # on Linux distributions
    # on RaspberryPi
    if [ $arq == "armv7l" ]; then
        curl https://processing.org/download/install-arm.sh | sudo sh
        sudo cp ./bin/opf-processing.sh /usr/local/bin/
        sudo chmod +x /usr/local/bin/opf-processing.sh
    else
      echo "Normal install processing https://processing.org/download/"
    fi


elif [ $os == "Darwin" ]; then

    # ON MacOX
    echo "osx"
    echo "Normal install processing https://processing.org/download/"

fi
