FROM nginx:1.11-alpine

COPY conf/nginx-proxy.conf /etc/nginx/nginx.conf
COPY conf/entrypoint.sh /entrypoint.sh

COPY ssl/server.pem /etc/nginx/ssl/server.pem
COPY ssl/server.key /etc/nginx/ssl/server.key

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories
RUN apk --no-cache add shadow
RUN useradd www-data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
