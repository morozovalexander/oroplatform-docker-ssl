#!/bin/bash
php app/console oro:assets:install
php app/console assetic:dump
php app/console oro:requirejs:build
