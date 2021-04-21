#!/bin/bash
###
# Usage: source <(curl "https://raw.githubusercontent.com/craigiswayne/wp-local-docker/feature/docker-compose-trimmed/bin/wp-reset-admin-user.sh" )

###
# My Gist: https://gist.github.com/craigiswayne/866233d5432c7230e11fb2729afc46df
# see here: https://wp-cli.org/commands/user/update/
###
function wp_reset_admin_user () {
  echo "#################################";
  echo "Resetting the Admin User...";
  username=admin;
  admin_pass=admin;
  email=$(git config user.email);
  name="Craig";
  # name=$(git config user.name);

  echo "Attempting to create User with username: $username";
  # wp user create $username $email --role=administrator --display_name="$name" --first_name="$name" --last_name="" --skip-themes --skip-plugins --skip-packages --allow-root;
  wp user create "$username" "$email" --display_name="$name" --first_name="$name" --last_name="" --skip-themes --skip-plugins --skip-packages --allow-root;

  echo "Updating the password for User: $username";
  wp user update $username --user_pass=$admin_pass --user_email=$email --skip-email --skip-plugins --skip-themes --skip-packages --allow-root;

  echo "Setting the Site's Admin Email to $email";
  wp option update 'admin_email' $email --skip-themes --skip-plugins --skip-packages --allow-root;

  echo "Setting User ($username) role to administrator";
  wp user set-role $username 'administrator';

  echo "Admin Username = '$username'";
  echo "Admin Password = '$admin_pass'";
  echo "#################################";
}
