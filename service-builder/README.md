# Service Builder

## Liferay with MySQL

1. Start a MySQL server with the following command.

	```
	d run \
		--name ephesians-mysql \
		--rm \
		-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
		-e MYSQL_DATABASE=lportal \
		-e MYSQL_PASSWORD=test \
		-e MYSQL_USER=test \
		-it \
		-p 3306:3306 \
		mysql:5.7 \
		--character-set-server=utf8mb4 \
		--collation-server=utf8mb4_unicode_ci
	```

1. Type ***d exec -it ephesians-mysql mysql -utest -ptest*** to connect to the MySQL server via the MySQL client.

1. Type ***use lportal;*** to open the ***lportal*** schema.

1. Type ***show tables;*** to list the tables in the ***lportal*** schema. No tables exist because the database is empty.