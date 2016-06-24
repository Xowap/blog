build:
	rm -fr dist
	hugo -d dist
	find dist -name '*.html' -exec sed -i s/xxxxxxxxxxnopexxxxxxxxxxx/hyperthese2/g '{}' ';'

deploy: check-env build
	mkdir -p $(DEPLOY_DIR)
	echo "$(DEPLOY_DIR)"
	rsync -rtv --delete dist/ "$(DEPLOY_DIR)/"

check-env:
ifndef DEPLOY_DIR
	$(error DEPLOY_DIR is undefined)
endif
