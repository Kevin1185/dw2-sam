# Gebruik de Ubuntu 20.04 basisimage
FROM ubuntu:20.04

# Update de pakketlijst en installeer apache2

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Maak een directory aan voor de buildtime.txt
RUN mkdir -p /var/www/html

# Voeg een buildtime.txt bestand toe met de huidige datum en tijd
RUN date > /var/www/html/buildtime.txt

COPY html /var/www/html/
WORKDIR /var/www/html/

# Configureer apache2 om te luisteren op poort 81
RUN sed -i 's/Listen 80/Listen 81/' /etc/apache2/ports.conf
RUN sed -i 's/:80/:81/' /etc/apache2/sites-available/000-default.conf

# Expose poort 81
EXPOSE 81

# Start apache2 in de voorgrond
CMD ["apache2ctl", "-D", "FOREGROUND"]




