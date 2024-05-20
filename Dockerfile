
# Gebruik een basisimage met een webserver, bijvoorbeeld nginx
FROM nginx:alpine

# Maak een directory aan voor de buildtime.txt
RUN mkdir -p /usr/share/nginx/html

# Voeg een buildtime.txt bestand toe met de huidige datum en tijd
RUN date > /usr/share/nginx/html/buildtime.txt

# Expose poort 81
EXPOSE 81

# Start nginx en luister op poort 81
CMD ["nginx", "-g", "daemon off;"]


