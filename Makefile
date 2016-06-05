build:
	rm -fr dist
	hugo -d dist

deploy: check-env build
	mkdir -p $(DEPLOY_DIR)
	echo "$(DEPLOY_DIR)"
	rsync -rtv --delete dist/ "$(DEPLOY_DIR)/"

check-env:
ifndef DEPLOY_DIR
	$(error DEPLOY_DIR is undefined)
endif
