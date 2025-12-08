FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

COPY mvnw pom.xml ./
COPY .mvn .mvn

RUN ./mvnw -q -Dmaven.test.skip=true dependency:go-offline

COPY src src
RUN ./mvnw -q -Dmaven.test.skip=true package

# ====== Run stage ======
FROM eclipse-temurin:17-jre
WORKDIR /app

RUN useradd -u 1001 spring
USER spring

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]