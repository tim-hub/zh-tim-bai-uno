HUGO ?= hugo
DATE ?= $(shell date +%F)
SLUG ?= $(firstword $(filter-out help new preview,$(MAKECMDGOALS)))

.DEFAULT_GOAL := help
.PHONY: help init new preview

help:
	@echo "make init                 fetch the theme submodule (needed once after clone)"
	@echo "make new [my-post-slug]   create draft content/posts/$(DATE)-my-post-slug.md"
	@echo "                          without a slug it numbers: $(DATE)-1.md, -2.md, ..."
	@echo "make preview              serve site with drafts on http://localhost:1313"

init:
	git submodule update --init --recursive

new:
	@slug='$(SLUG)'; \
	if [ -z "$$slug" ]; then \
		n=1; while [ -e content/posts/$(DATE)-$$n.md ]; do n=$$((n+1)); done; slug=$$n; \
	fi; \
	$(HUGO) new content/posts/$(DATE)-$$slug.md

preview:
	$(HUGO) server -D

# swallow the slug so `make new my-post-slug` does not look for a target named my-post-slug
%:
	@:
