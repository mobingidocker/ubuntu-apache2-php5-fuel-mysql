#!/bin/bash

pushd /var/ymr
	php composer.phar config github-oauth.github.com `openssl aes-256-cbc -d -in /token.enc -pass file:/passphrase`
	rm -rf fuel/vendor 2>&1
	php composer.phar install 2>&1
	php composer.phar update 2>&1
	php oil refine migrate 2>&1

	mkdir -p /var/log/fuel
	ln -s /var/log/fuel/ /var/ymr/fuel/app/logs

	pushd fuel/app
		mkdir -p cache
		mkdir -p tmp
		chmod -R 777 logs
		chmod -R 777 cache
		chmod -R 777 tmp
	popd

popd
