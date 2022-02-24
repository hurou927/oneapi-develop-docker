USERNAME := godric

build:
	docker-compose build

run:
	docker-compose up -d

exec:
	docker-compose exec --user $$(id -u) -w "/home/$(USERNAME)" oneapi /bin/bash

root:
	docker-compose exec -w "/home/root" oneapi /bin/bash

kill:
	docker-compose kill
