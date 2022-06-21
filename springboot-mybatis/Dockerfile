FROM java:8

COPY *.jar /app.jar

CMD ["--server.port=4000"]

EXPOSE 4000

ENTRYPOINT ["java", "-jar", "/app.jar"]