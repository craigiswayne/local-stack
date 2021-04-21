DOCKER_DOCROOT="/var/www/html";
LOCAL_DOCROOT_RELATIVE="$HOME/code";
LOCAL_DOCROOT="$(realpath $LOCAL_DOCROOT_RELATIVE)";
DOCKER_WEB_USER="www-data";
alias curltime="curl -w \"@$HOME/code/wp-local-docker/bin/curl-format.txt\" -o NUL -s ";
alias cwd="pwd | rev | cut -d '/' -f1 | rev"

function target_docker_path (){
    CURRENT_LOCAL_PATH="$(realpath $(pwd))";
    echo ${CURRENT_LOCAL_PATH/$LOCAL_DOCROOT/$DOCKER_DOCROOT}
}

function wp (){
    scope="$(target_docker_path)";
    ARGS="$@";
    #  This is only supported in future versions of docker-compose
    #  docker-compose -f /usr/local/var/www/wp-local-docker/docker-compose.yml exec --workdir="$scope" --user www-data phpfpm bash -c "wp $wpArgs";
    docker-compose -f $LOCAL_DOCROOT/wp-local-docker/docker-compose.yml exec --user $DOCKER_WEB_USER phpfpm bash -c "if [ -d $scope ]; then cd $scope; fi; wp $ARGS";
}

function composer (){
    scope="$(target_docker_path)";
    ARGS="$@";
    #  This is only supported in future versions of docker-compose
    #  docker-compose -f /usr/local/var/www/wp-local-docker/docker-compose.yml exec --workdir="$scope" --user www-data phpfpm bash -c "wp $wpArgs";
    docker-compose -f $LOCAL_DOCROOT/wp-local-docker/docker-compose.yml exec --user $DOCKER_WEB_USER phpfpm bash -c "if [ -d $scope ]; then cd $scope; fi; composer $ARGS";
}

function wpld_phpfp (){
  docker exec -it -u $DOCKER_WEB_USER wp-local-docker-phpfpm bash
}

function php (){
    scope="$(target_docker_path)";
    ARGS="$@";
    #  This is only supported in future versions of docker-compose
    #  docker-compose -f /usr/local/var/www/wp-local-docker/docker-compose.yml exec --workdir="$scope" --user www-data phpfpm bash -c "wp $wpArgs";
    docker-compose -f $LOCAL_DOCROOT/wp-local-docker/docker-compose.yml exec --user $DOCKER_WEB_USER phpfpm bash -c "if [ -d $scope ]; then cd $scope; fi; php $ARGS";
}

#
#function php (){
#    ARGS="$@";
#    docker-compose -f /usr/local/var/www/wp-local-docker/docker-compose.yml exec --user $LOCAL_DOCKER_WEB_USER phpfpm bash -c "php $ARGS";
#}

##
# see: https://github.com/craigiswayne/craigiswayne.github.com/wiki/Remote-Debugging-with-XDebug-and-CLI
#
function xdebug_remote (){
    echo "see: https://github.com/craigiswayne/craigiswayne.github.com/wiki/Remote-Debugging-with-XDebug-and-CLI";
}

function xdebug_debug_file (){
    #php -dxdebug.remote_enable=1 -dxdebug.remote_autostart=On -dxdebug.remote_host=host.docker.internal -dxdebug.remote_port=9001 -r /var/www/html/smalls.landbou.com/wp-content/themes/smalls.landbou.com/inc/xml-ad-importer/debug.php
    #php -r /var/www/html/smalls.landbou.com/wp-content/themes/smalls.landbou.com/inc/xml-ad-importer/debug.php
    echo "todo:";
}

source $LOCAL_DOCROOT/wp-local-docker/bin/wp-reset-admin-user.sh
# source $LOCAL_DOCROOT/wp-local-docker/bin/watch-php-slowlog.sh
