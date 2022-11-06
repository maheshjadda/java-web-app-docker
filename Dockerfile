FROM maven:3.8.6-eclipse-temurin-8-alpine as team
COPY . .
RUN mvn clean package


FROM tomcat:jdk11
COPY --from=team target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war

FROM jenkins:2.60.3-alpine as team
RUN /opt/
COPY . .
CMD ["apt","update","-y"]
CMD ["systemctl"."enable","jenkins"]
CMD ["systemctl","restart","jenkins"]

EXPOSE 8080
CMD ["sh","catalina.sh"]
