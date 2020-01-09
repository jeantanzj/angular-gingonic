.PHONY: dev dev-stop start client-build lint
dev:
	docker-compose up --build
dev-stop:
	docker-compose down
client-build:
	cd client && ng build --prod=true && cd ..
start:
	export GIN_MODE=release && go build -o /tmp/app ./app/ && /tmp/app
lint:
	gofmt -w app/
