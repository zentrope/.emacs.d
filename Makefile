#
#
#

.PHONY: clean
.DEFAULT_GOAL := help

clean: ## Remove elc and *~ files
	rm -f *.elc
	find kfi -name '*.elc' -ls -delete
	find . -name '*~' -ls -delete

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
			| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}' \
			| sort
