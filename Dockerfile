# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine


WORKDIR /prod
 

EXPOSE 8081

COPY . ./
RUN ./mvnw package
COPY target/spring*.jar ./spring-pet.jar
CMD ["java", "-jar", "/prod/spring-pet.jar", "--server.port=8081"]

