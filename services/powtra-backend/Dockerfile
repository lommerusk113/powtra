FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
COPY services/powtra-backend/build/libs/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]