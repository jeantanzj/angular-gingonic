.PHONY: dev dev-stop client-install client-start server-install server-start start lint
dev:
	docker-compose up --build
dev-stop:
	docker-compose down
client-install:
	cd client && npm install
client-start:
	cd client && ng serve
server-install:
	go get -u github.com/githubnemo/CompileDaemon && go mod download
server-start:
	CompileDaemon -directory="app" -build="go build -o ../tmp/app ./" -command="/tmp/app"
start:
	cd client && ng build --prod=true && cd .. && export GIN_MODE=release && go build -o /tmp/app ./app/ && /tmp/app
lint:
	gofmt -w app/
