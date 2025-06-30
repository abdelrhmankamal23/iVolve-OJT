# FROM maven:3.9.10-eclipse-temurin-17-alpine
# WORKDIR /theApp
# COPY Docker1/ .
# RUN mvn package
# EXPOSE 8080
# CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]



FROM eclipse-temurin:17-jre-alpine
WORKDIR /theapp2
COPY Docker1/target/demo-0.0.1-SNAPSHOT.jar theapp2.jar
EXPOSE 8080
CMD ["java", "-jar", "theapp2.jar"]
