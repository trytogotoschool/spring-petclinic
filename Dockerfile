# Development build
FROM openjdk:8-jdk-alpine AS development

# Create app directory into Docker container
WORKDIR /app/build
# Build project
COPY . ./
RUN ./mvnw package


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
