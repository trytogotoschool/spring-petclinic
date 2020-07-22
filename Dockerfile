# Development build
FROM openjdk:8-jdk-alpine AS development

# Create app directory into Docker container
WORKDIR /usr/src/app

# Build project
COPY * ./
RUN ./mvnw package

# --------------------------------

# Production build
FROM openjdk:8-jdk-alpine AS production

# Expose container port
EXPOSE 8081

# Create app directory into Docker container
WORKDIR /usr/src/app

# Bundle app source
COPY --from=development /usr/src/app/target/*.jar ./target

# Let's run the app!
CMD ["java", "-jar", "/prod/spring-pet.jar", "--server.port=8081"]
