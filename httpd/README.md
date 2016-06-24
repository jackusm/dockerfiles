docker-httpd
============

CentOS 6 With HTTPD


docker run -d -i --name webserver -v /srv/projects/webserver-files:/var/www/html -p 80 -e VIRTUAL_HOST=example.com -t avalawn/docker-httpd
