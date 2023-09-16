FROM openjdk:20
COPY target/admin-0.0.1-SNAPSHOT.jar slw-admin-server-1.0.0.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","/slw-admin-server-1.0.0.jar"]
