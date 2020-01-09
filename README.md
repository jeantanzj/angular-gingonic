

## How to run
```sh
make start # starts server in production mode
make dev # creates containers, starts server in debug mode with hot reload
make dev-stop # stops server and removes containers
make client-build # builds client/dist
make lint # formats go source code
```

## To run the development build locally
The development build runs on Debian GNU/Linux 10 (buster), and contains both Golang and node/npm, so that we can hot reload the server and client when developing. 

```sh
make dev
```

## To run the production build locally
The production build runs on Alpine. It is a multistage build that does not have node/npm installed after the client's bundles have been built. 

```sh
docker build -t angular-gingonic-prod -f Dockerfile .
docker run -p "4300:4300" angular-gingonic-prod
```
