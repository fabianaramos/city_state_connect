## City State Connect

# Pre-requisites

- install [docker](https://docs.docker.com/get-docker/)

# Starting the application

- Copy and paste the following command on your terminal:

```bash
$ docker compose up
```

# Setting up the database

- Copy and paste the following commands on your terminal:

```bash
$ docker ps
$ docker exec -it <CONTAINER_ID> rails db:create
$ docker exec -it <CONTAINER_ID> rails db:migrate
$ docker exec -it <CONTAINER_ID> rails db:seed


```

# Running tests

- Copy and paste the following command on your terminal:

```bash
$ docker exec -it <CONTAINER_ID> rspec
```

# Acessing application

- http://localhost:3000 on browser (frontend application)

or

- install [postman](https://www.postman.com/downloads/) and import the [postman collection](https://github.com/fabianaramos/city_state_connect/blob/main/city_state_connect.postman_collection) to send requests (api)
