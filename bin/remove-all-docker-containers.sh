AVAILABLE_CONTAINERS="$(docker ps -aq)";
if [ ! -z "$AVAILABLE_CONTAINERS" ];
then
    echo "Removing ALL docker containers";
    docker rm $AVAILABLE_CONTAINERS;
    echo "";
fi;
