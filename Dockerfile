FROM maven:latest
RUN mkdir /commerce
WORKDIR /commerce
COPY . .
EXPOSE 8080
CMD ["mvn", "spring-boot:run"]