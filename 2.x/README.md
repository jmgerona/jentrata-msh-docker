# jentrata-msh-docker
Automated jenkins msh build, sourcing from cloudbees snapshot.

We recommend for development purposes using the docker-compose file found in the main jentrata-msh repository: [https://github.com/jentrata/jentrata-msh]

## Start Jentrata with a postgresql docker container

This is essentially doing what docker-compose is configured to do.

You might want to do this in two terminal windows.

First start Postgresql: (If you don't want to run this in it's own term add a '-d' flag.) This command will also setup the
database as required.

        docker run --name 'jentrata-db' -v "./Dist/src/main/scripts/sql/as2.sql:/work/sql/as2.sql" -v "./Dist/src/main/scripts/sql/ebms.sql:/work/sql/ebms.sql" -v "./ContainerFiles/initdb.sh:/docker-entrypoint-initdb.d/initdb.sh" -e "POSTGRES_USER=jentrata" -e "POSTGRES_PASSWORD=jentrata" -e "POSTGRES_DB=jentrata" -e "DB_USER_NAME=corvus" -e "DB_USER_PASS=corvus" postgres:9.5

Then start jentrata:

        docker run --name 'jentrata' --link 'jentrata-db:db' -p 8080 jentrata/jentrata-msh:2.x

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
