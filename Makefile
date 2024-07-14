# Variables
DOCKER_REGISTRY=thientam1992
VERSION=$(shell cat VERSION)

# Define targets
.PHONY: deploy-prod

# Clean up dangling images
clean:
	@docker system prune -f

deploy-prod:
	docker compose --env-file .env --compatibility --profile=prod -f docker-compose.yml up -d --no-deps --remove-orphans --build
