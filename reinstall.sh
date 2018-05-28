#!/bin/bash
php app/console oro:install \
--timeout=0 \
--env=prod \
--drop-database \
--application-url=https://webserver.oro.docker \
--organization-name=OROPLATFORM \
--user-name=admin \
--user-email=useremail@gmail.com \
--user-firstname=FIRSTNAME \
--user-lastname=LASTNAME \
--user-password=admin \
--sample-data=n