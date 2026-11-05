
# Stage 1: Build Spring Boot application
FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /build

# Copy Maven configuration
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline

# Copy application source code
COPY src ./src

# Compile and package
RUN mvn clean package -DskipTests

# Stage 2: Run Spring Boot application
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy generated JAR from build stage
COPY --from=build /build/target/*.jar app.jar

# Render uses its PORT environment variable
EXPOSE 10000

ENTRYPOINT ["java", "-jar", "app.jar"]
