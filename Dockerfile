FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR .
COPY src /home/app/src
COPY application.properties /home/app
COPY log4j2-weather.yml /home/app
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:11-jre-slim
# Bash script
# Commented on purpose
#ENV ISITCURRENTLYFISHY = notatall
COPY check_env_var.sh /root/check_env_var.sh
RUN chmod +x /root/check_env_var.sh
RUN apt-get update
RUN apt-get -y install cron
RUN crontab -l | { cat; echo "* * * * * bash /root/check_env_var.sh"; } | crontab -
CMD ["service","cron","start"]
# Java webapp part
#COPY --from=build /home/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
