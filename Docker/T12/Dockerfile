FROM maven:3.9.10-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY Docker1/ .
RUN mvn clean package



FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
