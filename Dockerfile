FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y zip nginx curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html \
    && curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master \
    && cd /var/www/html \
    && unzip master.zip \
    && mv 2048-master/* . \
    && rm -rf 2048-master master.zip

EXPOSE 80

CMD [ "/usr/sbin/nginx" ]