node_modules: package.json
	npm install

build: package.json node_modules
	@mkdir -p $(CURDIR)/dist
	$(CURDIR)/node_modules/.bin/sass \
	    --style=compressed $(CURDIR)/src/uss.sass $(CURDIR)/dist/uss.css

release:
	git checkout develop
	bump2version patch
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

