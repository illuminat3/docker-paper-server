# Use java version 21
FROM openjdk:21-jdk-slim


WORKDIR /minecraft
RUN apt-get update && apt-get install -y wget jq

# Expose minecraft and dynmap ports
EXPOSE 25565
EXPOSE 8123

COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
