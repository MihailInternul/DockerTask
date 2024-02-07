# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn -B -DskipTests clean package

# Stage 2: Create a minimal image
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/spring-petclinic-3.2.4-SNAPSHOT.jar /app/spring-petclinic.jar
CMD ["java", "-jar", "spring-petclinic.jar"]
