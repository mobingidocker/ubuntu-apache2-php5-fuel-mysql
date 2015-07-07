#!/bin/bash

pushd /var/www/html
	php composer.phar config github-oauth.github.com e318808116a128677a3d867c2df32b0b95e93d0f
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
	ln -s /var/log/fuel/ /var/www/html/fuel/app/logs

popd

