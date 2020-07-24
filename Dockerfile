# Development build
FROM openjdk:8-jdk-alpine AS development

WORKDIR /app/build
# Build project
COPY .mvn /app/build/.mvn
COPY pom.xml /app/build/pom.xml
COPY mvnw /app/build/mvnw
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline
COPY src /app/build/src
RUN ./mvnw package -DskipTests



# Production build
FROM openjdk:8-jdk-alpine AS production

# Expose container port
EXPOSE 8081

# Create app directory into Docker container
WORKDIR app/prod

# Bundle app source
COPY --from=development /app/build/target/*.jar /app/prod/spring-pet.jar
# Let's run the app!
CMD ["java", "-jar", "/app/prod/spring-pet.jar", "--spring.profiles.active=mysql", "--server.port=8081"]
