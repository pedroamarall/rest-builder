# Service Builder

## Liferay with MySQL

1. Start MySQL with the following command.

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
		mysql:8 \
		--character-set-server=utf8mb4 \
		--collation-server=utf8mb4_unicode_ci
	```

	Notice the name given to the MySQL container.

1. Type ***d exec -it ephesians-mysql mysql -utest -ptest*** to connect to MySQL.

1. Type ***use lportal;*** to go into the ***lportal*** database.

1. Type ***show tables;*** to see that there are no tables.

1. Start Liferay with the following command.

	```
	docker run \
		--link ephesians-mysql \
		--name ephesians-liferay \
		--rm \
		-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME="com.mysql.jdbc.Driver" \
		-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD="test" \
		-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mysql://ephesians-mysql/lportal?characterEncoding=UTF-8&useFastDateParsing=false&useUnicode=true" \
		-e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME="test" \
		-it \
		-p 8080:8080 \
		liferay/portal:7.3.6-ga7
	```

	Notice the name given to the Liferay container and how it is linked to the MySQL container.

1. Verify on the Liferay console that it is connected to MySQL.

	```
	2021-03-24 01:03:33.351 INFO  [main][DialectDetector:159] Using dialect org.hibernate.dialect.MySQLDialect for MySQL 8.0
	2021-03-24 01:03:33.409 INFO  [main][DBInitUtil:132] Create tables and populate with default data
	```

1. Type ***show tables;*** to see that many tables were created.

1. Notice that it took longer for Liferay to startup.

	```
	24-Mar-2021 01:04:30.979 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [64616] milliseconds
	```

	Why? The default Liferay Docker image runs with an embedded Hypersonic database that includes prepopulated data. Since this is connecting to a vanilla MySQL database with no tables, Liferay had to create the tables and populate the data.

	Below is a small sample of those log messages.

	```
	2021-03-24 01:04:04.272 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.events.StartupHelperUtil#initResourceActions
	2021-03-24 01:04:04.466 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.events.StartupHelperUtil#initResourceActions in 194 ms
	2021-03-24 01:04:04.472 INFO  [main][VerifyProcess:65] Verifying com.liferay.portal.verify.VerifyProperties
	2021-03-24 01:04:04.472 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.verify.VerifyProperties#verifySystemProperties
	2021-03-24 01:04:04.472 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.verify.VerifyProperties#verifySystemProperties in 0 ms
	2021-03-24 01:04:04.473 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.verify.VerifyProperties#verifyPortalProperties
	2021-03-24 01:04:04.480 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.verify.VerifyProperties#verifyPortalProperties in 7 ms
	2021-03-24 01:04:04.481 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.verify.VerifyProperties#verifyDocumentLibrary
	```

1. Type ***<Control+C>*** to stop Liferay. Type ***\<Up\>*** and ***\<Enter\>*** to restart Liferay. Notice that Liferay started faster this time and that there are fewer log messages. Why?

## service.xml

1. Create and go to a directory called ***my-service-builder-project***. Follow the steps in [Set Up an OSGi Project](../osgi#set-up-an-osgi-project).