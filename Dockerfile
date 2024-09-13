FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /workdir/app
COPY pom.xml .
COPY src src

RUN mvn package -DskipTests

FROM openjdk:17-jdk-slim

COPY --from=build /workdir/app/target/benchmarking-0.0.1.jar benchmarking.jar

ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar -XX:MinRAMPercentage=60 -XX:MaxRAMPercentage=90 -server -XX:+OptimizeStringConcat -XX:+UseStringDeduplication /benchmarking.jar