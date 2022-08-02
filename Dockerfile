FROM maven:latest
RUN mkdir /commerce
WORKDIR /commerce
COPY . .
EXPOSE 8888
CMD ["mvn", "spring-boot:run"]