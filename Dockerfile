FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package
FROM amazoncorretto:8
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/graphql-poc.jar /app/
ENTRYPOINT ["java", "-jar", "graphql-poc.jar"]
