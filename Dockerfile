FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/pavan-macherla/App.git

FROM maven:3.6.3-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/App /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/spring-boot-actuator-0.0.1-SNAPSHOT.jar /app
CMD ["java -jar spring-boot-actuator-0.0.1-SNAPSHOT.jar"]
