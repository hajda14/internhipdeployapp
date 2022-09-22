#!/bin/bash
# sudo update-alternatives --install /usr/bin/python python3 /usr/bin/python3.9 20

DIR=$(pwd)


if(pacman --version);then
    echo "pacman manager found"
    sudo pacman -Sy
    sudo pacman --noconfirm -S nginx curl 
    # curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
    # export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    # nvm install v16.15.1
    # nvm use v16.15.1
elif(apt --version);then
    echo "apt manager found"
    sudo apt-get update
    sudo apt-get -y install nginx curl
    # curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
    # export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    # nvm install v16.15.1
    # nvm use v16.15.1
fi


echo "installing backend requirements"
python3 -m pip install pipenv
python3 -m pipenv install
echo "installing frontend requirements"
cd $DIR/frontend
# npm install
# npm run build


# cd $DIR/backend
# export FLASK_APP=app
# export FLASK_ENV=development
# pipenv run flask run