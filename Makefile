# Variables
DOCKER_REGISTRY=thientam1992
VERSION=$(shell cat VERSION)

# Map directories to tag names
TAG_NAMES = \
    TEK.Payment.Core:kiosk-core-api \
    TEK.BVK.HIS.Gateway:kiosk-out-gw \
    TEK.Core.Admin:kiosk-admin-api \
    TEK.Gateway.K:kiosk-in-gw \
    TEK.DepartmentGroup.API:kiosk-dept-api

# Define targets
.PHONY: deploy-prod

# Clean up dangling images
clean:
	@docker system prune -f

deploy-prod:
	docker compose --env-file .env --compatibility --profile=prod -f docker-compose.yml up -d --no-deps --remove-orphans --build
