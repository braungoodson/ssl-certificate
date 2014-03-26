.PHONY: clean ssl-certificate test

clean:

	@rm -rf builds/*

ssl-certificate:

	@apt-get -y install ssl-cert
	@make-ssl-cert generate-default-snakeoil --force-overwrite
	@cd /etc/ssl
	@cat private/ssl-cert-snakeoil.key certs/ssl-cert-snakeoil.pem > snakeoil.pem

npm-install:

	@npm install express.io

launch-http-server:

	@node test/launch-http-server.js

build-http-server:

	@npm-install
	@launch-http-server

install-nodejs:

	@curl -O http://nodejs.org/dist/v0.11.9/node-v0.11.9-linux-x64.tar.gz
	@tar -zxvf node-v0.11.9-linux-x64.tar.gz

install-git:

	@apt-get -y install g++
	@apt-get -y install git

install:

	@install-git
	@install-nodejs

build:

	@install
	@build-http-server

launch:

	@launch-http-server

