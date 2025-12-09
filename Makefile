DOCKER_MOUNT_ARGS?=

.PHONY: all test

.PHONY: clean
clean:
	@rm -rf public

sync-data:
	@scripts/sync-data.sh

.PHONY:
prep:
	@npm install

.PHONY: docker-prep
docker-prep:
	@docker run --rm --mount "type=bind,source=$(CURDIR),destination=$(CURDIR)$(DOCKER_MOUNT_ARGS)" --workdir "$(CURDIR)" hugomods/hugo:exts npm install

.PHONY: build
build: prep clean sync-data
	@hugo

.PHONY: docker-build
docker-build: clean sync-data
	@docker run --rm --publish 1313:1313 --mount "type=bind,source=$(CURDIR),destination=$(CURDIR)$(DOCKER_MOUNT_ARGS)" --workdir "$(CURDIR)" hugomods/hugo:exts hugo

.PHONY: view
view: prep clean sync-data
	@hugo server --navigateToChanged

.PHONY: docker-view
docker-view: clean sync-data
	@docker run --rm --publish 1313:1313 --mount "type=bind,source=$(CURDIR),destination=$(CURDIR)$(DOCKER_MOUNT_ARGS)" --workdir "$(CURDIR)" hugomods/hugo:exts hugo server

.PHONY: lint
lint:
	@MODIFIED_MD_FILES=$$(git diff --name-only HEAD | grep '\.md$$'); \
	if [ -n "$$MODIFIED_MD_FILES" ]; then \
		echo "Running markdown linters on:"; \
		printf "  - %s\n" $$MODIFIED_MD_FILES; \
		echo "\n******** markdownlint ********"; \
		$(MAKE) markdownlint --no-print-directory; MARKDOWN_EXIT_CODE="$$?"; \
		echo "\n********     vale     ********"; \
		$(MAKE) vale --no-print-directory; VALE_EXIT_CODE="$$?"; \
		echo "\n******************************"; \
		echo "\nFor more information, see: https://handbook.gitlab.com/docs/development/#linting-content"; \
		let "EXIT_CODE = $${MARKDOWN_EXIT_CODE} + $${VALE_EXIT_CODE}"; \
		exit $${EXIT_CODE}; \
	else \
		echo "No markdown files to lint"; \
	fi

.PHONY: markdownlint
markdownlint:
	@STARTING_COMMIT="" scripts/markdownlint.sh HEAD

.PHONY: vale
vale:
	@STARTING_COMMIT="" scripts/vale.sh HEAD
