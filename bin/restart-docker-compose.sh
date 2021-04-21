#!/bin/sh
FOLDER_ROOT=~/code/wp-local-docker;
# Setup configs
ln -sfv $FOLDER_ROOT/config/git/.gitconfig ~/
ln -sfv $FOLDER_ROOT/config/git/.gitignore ~/

sh $FOLDER_ROOT/bin/stop-all-docker-containers.sh;
# sh remove-all-docker-containers.sh;
echo "Docker compose going up :)....";
docker-compose up -d --remove-orphans
echo "";
