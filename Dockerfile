
FROM ubuntu:20.04



ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



RUN mkdir -p /var/www/html


RUN date > /var/www/html/buildtime.txt

COPY html /var/www/html/
WORKDIR /var/www/html/

RUN sed -i 's/Listen 80/Listen 81/' /etc/apache2/ports.conf
RUN sed -i 's/:80/:81/' /etc/apache2/sites-available/000-default.conf


EXPOSE 81


CMD ["apache2ctl", "-D", "FOREGROUND"]




