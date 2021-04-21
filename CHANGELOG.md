# 2018-12-12
* gitignore and gitconfigs gets linked when trying to restart docker images in bin/restart-docker-compose.sh
* bin/wp-auto-config.sh & bin/aliases.sh now makes use of more variables
* git configs now added to repository
* tomorrow-night terminal now part of repository


# 2018-09-10 - Force all http -> https
* all traffic to http gets redirected to https

# 2018-09-02 - Performance tweaks
* bash alias for restarting all docker containers now sends messages
* add perfomance tweaks for static assets via nginx
* added more xdebug configs to force displaying errors
* added more php configs for error logging
* added performance tweaks to docker-compose.yml (see: https://docs.docker.com/docker-for-mac/osxfs-caching/)
* updated readme
* added inline comments to the docker-compose.yml file
* enabled the rewrite log in nginx
* enabled the php-fpm slow log

# 2018-08-27
* Set ``memory_limit = 512M`` in php.ini for wp-cli to update
* Cleaned up nginx generic host
* Set the max nesting level in xdebug configs to 100
* Cleaned up docker-composer files
* Added in and mounted generic wp-cli.yml for future use which will extend upon wp-cli
* Added in a localhost nginx config with accompanying index.php

# 2018-08-16
* Added bash script to reset the admin user for wordpress

# 2018-08-15
* Performance, Security and Pruning tweaks to the nginx default server config
* Updated README.md with instructions on how to use wp-cli

# 2018-08-13
* default content type changed to text/plain so that any file can be browsed via the url, assists with viewing the composer.lock file
* lock files are now served as json files
* added verbosity to container restart script
* added the ability to try other environments for assets before failing. see config/nginx/conf.d
* Removed unnecessary sqetup scripts

# 2018-08-12 | xdebug, container tweaks, markdown parser, custom logs
* Xdebug is now working on port 9001
* Containers now have custom names
* instead of just linking the default.conf, it's directory is now linked
* Added shell script to restart containers. See ./bin/restart-docker-compose.sh
* Added the ability to override some nginx error pages. See ./config/nginx/errors
* Custom NGINX log definitions have been moved to ./config/nginx/conf.d/custom-logs.conf

# 2018-08-11 | webroot bindings, nginx with regex and verbose logging
* docker-compose.yml file now binds to the webroot for all sites and not just one wordpress instance
* default.conf now has a more verbose logging format
* default.conf now uses a regex to determine server name
* default.conf now states the root according to the matched regex
* default.conf now uses index.php, index.html, README.md, Home.md as index fallbacks
* No need for the wordpress folder since the nginx configs bind to the systems webroot
* No need for the logs folder as it is not bound to the nginx volume any more
