build: package.json
	@mkdir -p $(CURDIR)/dist
	@$(CURDIR)/node_modules/.bin/node-sass \
	    --output-style=compact $(CURDIR)/src/uss.sass > $(CURDIR)/dist/uss.css

release:
	git checkout develop
	bumpversion patch
	git checkout master
	git rebase develop
	git checkout develop
	git push --all
	git push --tags

commit:
	git commit -am 'wip' || true

upload: build commit release
	npm publish

package.json:
	yarn

