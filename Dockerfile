# syntax=docker/dockerfile:1.7

# Dockerfile para aplicação Spring Boot

# Estágio de build
FROM maven:3.9-eclipse-temurin-25-alpine AS builder
WORKDIR /build
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn -B -ntp dependency:go-offline
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 mvn -B -ntp package -DskipTests

# Estágio de execução
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app
COPY --from=builder /build/target/*.jar app.jar
EXPOSE 9191
ENTRYPOINT ["java","-jar","app.jar"]