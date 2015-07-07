#!/bin/bash

pushd /var/ymr
	php composer.phar config github-oauth.github.com 6bb28c05f98e11fd6601f8f7fe3d6cf3df78bafc
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

