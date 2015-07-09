#!/bin/bash

pushd /var/ymr
	php composer.phar config github-oauth.github.com `openssl aes-256-cbc -d -in /token.enc -pass file:/passphrase`
	rm -rf fuel/vendor
	php composer.phar install
	php composer.phar update
	FUEL_ENV=production php oil refine migrate

	pushd fuel/app
		mkdir -p logs
		mkdir -p cache
		mkdir -p tmp
		chmod -R 777 logs
		chmod -R 777 cache
		chmod -R 777 tmp
	popd

	mkdir -p /var/log/fuel
	ln -s /var/log/fuel/ /var/ymr/fuel/app/logs

popd
