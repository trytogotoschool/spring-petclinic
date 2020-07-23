# Development build
FROM openjdk:8-jdk-alpine AS development

# Create app directory into Docker container
WORKDIR /prod
# Build project
COPY . ./
RUN ./mvnw package


# Production build
FROM openjdk:8-jdk-alpine AS production

# Expose container port
EXPOSE 8081

# Create app directory into Docker container
WORKDIR /prod

# Bundle app source
COPY --from=development /prod/target/*.jar /target

# Let's run the app!
CMD ["java", "-jar", "/prod/target/spring-pet.jar", "--server.port=8081"]
