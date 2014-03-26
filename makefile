.PHONY: clean ssl-certificate test

clean:

	@rm -rf builds/*

ssl-certificate:

	@apt-get install ssl-cert
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
