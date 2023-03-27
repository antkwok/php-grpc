file := version.txt
include .env.developer

build_prod:
	$(eval version=`cat ${file}`)
	@echo "Build production docker image for $(version)"
	docker build -t antkwok/php-grpc:$(version) .

push_prod:
	$(eval version=`cat ${file}`)
	@echo "Push image for $(version)"
	docker login --username=$(DOCKER_LOGIN_USERNAME) && \
	docker push antkwok/php-grpc:$(version)
