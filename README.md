## Start environment

1. Create ORO_APP env var, enter project root and run
    ```
    export ORO_APP=$(pwd)
    ```
    
2. Define environment variable with application env mode (prod or dev, prod by default)
    ```
    export SYMFONY_ENV=prod
    ```
   > This variable is optional (will be in prod mode if not defined)
    
3. Put your self-signed certs (server.key, server.pem) onto /environment/nginx-proxy/ssl/
   
   > They will be copied and used for ssl nginx proxy server
    
4. Configure GitHub token for current project. To retrieve new token [follow by this link](https://github.com/settings/tokens/new?scopes=repo&description=Composer+OroEnv).
    ```
    docker run -v $ORO_APP/environment/.composer/auth/:/usr/local/composer/auth oroinc/composer:1.4 config -g github-oauth.github.com <YOUR_GITHUB_AUTH_TOKEN>
    ```
    
5. Run docker compose
    ```
    docker-compose -p oro -f environment/php71_nginx_pgsql_full_ee.yml up
    ```

6. Wait until composer vendors installation. Proceed once you see next message
    
    > oro_composer_1 exited with code 0
    
7. Stop docker-compose (composer already installed dependencies)
    ```
    ctrl + c
    ```

8. Run docker-compose in detached mode
    ```
    docker-compose -p oro -f environment/php71_nginx_pgsql_full_ee.yml up -d
    ```

9. Install project once

    enter the working container
    ```
    docker-compose -p oro -f environment/php71_nginx_pgsql_full_ee.yml exec --user www-data php bash
    ```
    
    run installation commands
    ```
    sh reinstall.sh
    ```
    
    exit typing `exit` command

10. Access oro platform in browser by following url:
    ```
    http://webserver.oro.docker 
    ```