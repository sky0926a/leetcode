SHELL := /bin/bash
ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

.PHONY: empty
empty:
	@python3 scripts/new_problem.py $(ARGS)

%:
	@:
