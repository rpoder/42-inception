# [42Project] Inception

This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.

TO DO BEFORE PUSH
- read le sujet
- delete .git pour supp .env



## Run Locally

Build and start containers
```bash
  make up
```

Stop containers
```bash
  make down
```

Open terminal of a running container

```bash
  make in-[container_name]
```

Clean files, volumes, networks and images

```bash
  make fclean
```

## Authors

- [@rpoder42](https://www.github.com/rpoder42)


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file.
The .env file must be in the /srcs/ folder

`SQL_DATABASE_NAME`
`SQL_USER_NAME`
`SQL_USER_PASSWORD`
`SQL_ROOT_NAME`
`SQL_ROOT_PASSWORD`
`DOMAIN_NAME`
`WP_TITLE`
`WP_ADMIN_USR`
`WP_ADMIN_PASSWORD`
`WP_ADMIN_EMAIL`
`WP_USERNAME`
`WP_EMAIL`
`WP_PASSWORD`
