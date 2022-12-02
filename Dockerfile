FROM nginx:latest
COPY website/site.html /usr/share/nginx/html/index.html
COPY website/css /usr/share/nginx/html/css
COPY website/resources /usr/share/nginx/html/resources
