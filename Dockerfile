FROM openjdk:11

COPY target/demo-0.0.1-SNAPSHOT.jar demo-1.0.0.jar

ENTRYPOINT [ "java", "-jar", "demo-1.0.0.jar" ]