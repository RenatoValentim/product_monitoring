.PHONY: help test

all: test

APP = productmonitoring

help: ## Print help for each target
	$(info === Product Monitoring, Makefile help ===)
	$(info =========================================)
	$(info )
	$(info Available commands:)
	$(info )
	@grep '^[[:alnum:]_/]*:.* ##' $(MAKEFILE_LIST) \
		| sort | awk 'BEGIN {FS=":.* ## "}; {printf "%-25s %s\n", $$1, $$2};'

test: ## Run all tests
	@go test -v -failfast -cover ./internal/...
