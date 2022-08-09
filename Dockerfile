FROM maven:latest
RUN mkdir /commerce
WORKDIR /commerce
COPY . .
EXPOSE 8080
CMD ["mvn", "spring-boot:run"]

# Docker Build Stage
#FROM maven:3-jdk-8-alpine AS build


# Build Stage
#WORKDIR /opt/app

#COPY ./ /opt/app
#RUN mvn clean install -DskipTests


# Docker Build Stage
#FROM openjdk:8-jdk-alpine

#COPY --from=build /opt/app/target/*.jar app.jar

#ENV PORT 8081
#EXPOSE $PORT

#ENTRYPOINT ["java","-jar","-Xmx1024M","-Dserver.port=${PORT}","app.jar"]
