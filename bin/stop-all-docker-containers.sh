AVAILABLE_CONTAINERS="$(docker ps -aq)";
if [ ! -z "$AVAILABLE_CONTAINERS" ];
then
    echo "Stopping ALL docker containers";
    docker stop -t 30 $AVAILABLE_CONTAINERS;
    echo "";
fi;
