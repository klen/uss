build: package.json
	@mkdir -p $(CURDIR)/dist
	@$(CURDIR)/node_modules/.bin/node-sass \
	    --output-style=compact $(CURDIR)/src/uss.sass > $(CURDIR)/dist/uss.css

release:
	bumpversion patch

upload: build
	npm publish

package.json:
	yarn

