FROM maven:3.6.3-jdk-11-slim AS build
WORKDIR usr/src/app
COPY . ./
RUN mvn clean package

FROM openjdk:11-jdk
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/target/gateway-service-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","app.jar"]