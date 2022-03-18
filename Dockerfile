FROM maven:latest
RUN mkdir /Commerce
WORKDIR /Commerce
COPY . .
EXPOSE 8080
CMD ["mvn", "spring-boot:run"]