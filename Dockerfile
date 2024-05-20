# Gebruik de Ubuntu 20.04 basisimage
FROM ubuntu:20.04

# Update de pakketlijst en installeer nginx en date command (standaard aanwezig op Ubuntu)
RUN apt update

# Maak een directory aan voor de buildtime.txt
RUN mkdir -p /var/www/html

# Voeg een buildtime.txt bestand toe met de huidige datum en tijd
RUN date > /var/www/html/buildtime.txt


# Expose poort 81
EXPOSE 81


# Start apache2 in de voorgrond
CMD ["apachectl", "-D", "FOREGROUND"]



