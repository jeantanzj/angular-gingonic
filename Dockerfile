######## Part 1: Environment for building the node client
FROM node:13-alpine as clientBuilder
ENV HOME=/go/src/github.com/jeantanzj/angular-gingonic/client
WORKDIR $HOME

# Install tool needed for building client
RUN npm install -g @angular/cli

# Install client dependecies
COPY ./client/package.json .
RUN npm install

# Copy client files over and build it
COPY ./client .
RUN ng build --prod=true

######## Part 2: Environment for running Go server
FROM golang:1.13-alpine
ENV HOME=/go/src/github.com/jeantanzj/angular-gingonic
WORKDIR $HOME

# Copy the built files over from the previous stage, so that the server can serve these static files
COPY --from=clientBuilder $HOME/client/dist ./client/dist

# Install server dependencies
COPY ./go.mod .
RUN go mod download

# Copy server files over
COPY ./app ./app

EXPOSE 4300
# Run the server in production mode
CMD export GIN_MODE=release && go build -o /tmp/app ./app/ && /tmp/app