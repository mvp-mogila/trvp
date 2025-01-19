all:
	docker-compose --env-file ./server/.env up -d

stop:
	docker-compose --env-file ./server/.env down