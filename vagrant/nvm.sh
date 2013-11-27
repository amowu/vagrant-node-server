#!/bin/sh

node_version="${@}";

su -c "
    curl https://raw.github.com/creationix/nvm/master/install.sh | sh;
    source ~/.nvm/nvm.sh;
    nvm install $node_version;
    nvm alias default $node_version;
    echo 'source ~/.nvm/nvm.sh' >> ~/.bash_profile;
" vagrant;

exit 0;