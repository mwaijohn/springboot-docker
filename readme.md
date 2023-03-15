USER CRUD APPLICATION USING SPRING BOOT , POSTGRESS AND DOCKER

# start containers

docker compose up -d java_db

###
# get all users
GET http://localhost:8084/api/users HTTP/1.1

###

POST http://localhost:8084/api/users HTTP/1.1
content-type: application/json

{
    "name": "James Test",
    "email": "test@mail.com"
}

###
# get one user
GET http://localhost:8084/api/users/2 HTTP/1.1


###
# get one user
PUT  http://localhost:8084/api/users/2 HTTP/1.1
content-type: application/json

{
    "name": "James Testo",
    "email": "test@mail.com"
}

###
# delete one user
DELETE  http://localhost:8084/api/users/1 HTTP/1.1

Dockerfile

```
FROM openjdk:11

COPY target/demo-0.0.1-SNAPSHOT.jar demo-1.0.0.jar

ENTRYPOINT [ "java", "-jar", "demo-1.0.0.jar" ]
```

docker-compose.yaml

```yaml

version: '3.9'

services:
  #new service (java_app)
  java_app:
    container_name: java_app
    image: mwai/java_app:1.0.0
    build: .
    ports:
      - 8084:8080
    environment:
      - DATABASE_URL=jdbc:postgresql://java_db:5432/postgres
      - DATABASE_USERNAME=postgres
      - DATABASE_PASSWORD=postgres
    depends_on:
      - java_db

  #old service (postgres)
  java_db:
    container_name: java_db
    image: postgres:14
    ports:
      - 5434:5432
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata: {}```
