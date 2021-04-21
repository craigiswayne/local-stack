docker exec -it wp-local-docker-nginx bash

# Test NGINX Configs
# service nginx configtest
# nginx -t

# View All NGINX configs
# nginx -T


function view_logs () {
  docker logs -f wp-local-docker-nginx
}
