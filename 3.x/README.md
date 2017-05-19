# jentrata-msh-docker
Fork from jentrata/jentrata-msh-docker.

## Start Jentrata with a postgresql docker container

Start jentrata:

        docker-compose run -p 8080:8080 --rm jentrata

### Environment Variables

#### TOMCAT_USER_NAME

Set this to the username that you want to login to Tomcat's admin/management features AND jentrata with.

#### TOMCAT_USER_PASS

Set this to the password that you want to login to Tomcat's admin/management features AND jentrata with.

#### DB_USER_NAME

This is the database username specific to Jentrata, this is what jentrata will connect with.

#### DB_USER_PASS

This is the database password specific to Jentrata, this is what jentrata will connect with.

#### DB_HOST_NAME

This is the database host name to connect to, by default it attempts to connect to: "db"
