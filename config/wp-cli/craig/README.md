# WP-CLI Auto Setup

## What does it do?
1. creates your wp-config.php file if it does not exist via the following method
    ```
    wp config create --dbhost=mysql --dbuser=root --dbpass=password --dbname=paws --dbprefix=wp_
    ```
2. replaces db urls according to what your want your local dev url to be