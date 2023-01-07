FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
RUN apk add --no-cache bash
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
volumes = ["/certs/client"]
ENTRYPOINT ["./wait-for-it.sh", "mehdiguettiti.Hulk78901996:8761", "--", "java", "-jar"]
CMD ["/app.jar"]