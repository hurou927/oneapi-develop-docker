USERNAME := godric

build:
	mkdir -p share/home/root/workspace
	mkdir -p share/home/$(USERNAME)/workspace
	docker-compose build

clean_build:
	docker-compose build --no-cache

run:
	docker-compose up -d

exec:
	docker-compose exec --user $$(id -u) -w "/home/$(USERNAME)" oneapi /bin/bash

root:
	docker-compose exec -w "/home/root" oneapi /bin/bash

kill:
	docker-compose kill
