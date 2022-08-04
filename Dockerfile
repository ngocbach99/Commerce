FROM maven:latest
RUN mkdir /commerce
WORKDIR /commerce
COPY . .
EXPOSE 8081
CMD ["mvn", "spring-boot:run"]