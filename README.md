
# Angular 8 + Gin-gonic starter kit

This starter kit will run the go server at localhost:4300, and the angular dev server at localhost:4200.

# How to use
## With docker and docker-compose
### To run the development build locally
The development build runs on Debian GNU/Linux 10 (buster), and contains both Golang and node/npm, so that we can hot reload the server and client when developing. 

```sh
make dev
```

### To run the production build locally
The production build runs on Alpine. It is a multistage build that does not have node/npm installed after the client's bundles have been built. 

```sh
docker build -t angular-gingonic-prod -f Dockerfile .
docker run -p "4300:4300" angular-gingonic-prod
```

            
## Without docker and docker-compose

Pre-requisites:
- Have Go and node installed
- Check what your `GOPATH` and `GOROOT` env vars are, using `go env`
- Set your path:  `PATH=$PATH:$GOPATH/bin:$GOROOT/bin`
- Clone this repository into your `GOPATH`

```
- GOPATH
  - src
    - github.com
      - jeantanzj
        - angular-gingonic
```

- Have angular cli installed: `npm install -g @angular/cli`

### To run the development build locally

Install dependencies
```sh
make client-install
make server-install
```

Start the angular development server
```sh
make client-start
```

Start the go server
```sh
make server-start
```

### To run the production build locally

```sh
make start
```
