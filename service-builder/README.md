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

1. Type ***mkdir -p h7g5-api***. The prefix ***h7g5*** is just a random name used for this tutorial.

1. Type ***osub h7g5-api/bnd.bnd*** and paste the following code.

	```
	Bundle-Name: Liferay H7G5 API
	Bundle-SymbolicName: com.liferay.h7g5.api
	Bundle-Version: 1.0.0
	```

1. Type ***osub h7g5-api/build.gradle*** and paste the following code.

	```
	dependencies {
		compileOnly group: "com.liferay.portal", name: "release.portal.api"
	}
	```

1. Type ***./gradlew :h7g5-api:classes && la h7g5-api/build*** to verify that h7g5-api was created properly.

1. Type ***mkdir -p h7g5-service/src***.

1. Type ***osub h7g5-service/bnd.bnd*** and paste the following code.

	```
	Bundle-Name: Liferay H7G5 Service
	Bundle-SymbolicName: com.liferay.h7g5.service
	Bundle-Version: 1.0.0
	```

1. Type ***osub h7g5-service/build.gradle*** and paste the following code.

	```
	buildService {
		apiDir = "../h7g5-api/src/main/java"
		testDir = "../h7g5-test/src/testIntegration/java"
	}

	dependencies {
		compileOnly group: "com.liferay.portal", name: "release.portal.api"
		compileOnly project(":h7g5-api")
	}

1. Type ***./gradlew :h7g5-service:classes && la h7g5-service/build*** to verify that h7g5-service was created properly.

1. Type ***osub h7g5-service/service.xml*** and paste the following code.

	```
	<?xml version="1.0"?>
	<!DOCTYPE service-builder PUBLIC "-//Liferay//DTD Service Builder 7.3.0//EN" "http://www.liferay.com/dtd/liferay-service-builder_7_3_0.dtd">

	<service-builder auto-namespace-tables="true" dependency-injector="ds" package-path="com.liferay.h7g5">
		<namespace>OHQIWTSFHL</namespace>
		<entity local-service="true" name="H7G5Entry" remote-service="false">

			<!-- PK fields -->

			<column name="h7g5EntryId" primary="true" type="long" />

			<!-- Group instance -->

			<column name="groupId" type="long" />

			<!-- Audit fields -->

			<column name="companyId" type="long" />
			<column name="userId" type="long" />
			<column name="userName" type="String" />
			<column name="createDate" type="Date" />
			<column name="modifiedDate" type="Date" />

			<!-- Other fields -->

			<column name="h7g5FolderId" type="long" />
			<column name="description" type="String" />
			<column name="key" type="String" />
			<column name="name" type="String" />

			<!-- Order -->

			<order by="desc">
				<order-column name="createDate" />
			</order>

			<!-- Finder methods -->

			<finder name="H7G5FolderId" return-type="Collection">
				<finder-column name="h7g5FolderId" />
			</finder>
			<finder name="Key" return-type="H7G5Entry">
				<finder-column name="key" />
			</finder>
			<finder name="Name" return-type="Collection">
				<finder-column name="name" />
			</finder>
			<finder name="H_D_N" return-type="MemberRequest">
				<finder-column name="h7g5FolderId" />
				<finder-column name="description" />
				<finder-column name="name" />
			</finder>

			<!-- References -->

			<reference entity="Group" package-path="com.liferay.portal" />
		</entity>
		<entity local-service="true" name="H7G5Folder" remote-service="false">

			<!-- PK fields -->

			<column name="h7g5FolderId" primary="true" type="long" />

			<!-- Group instance -->

			<column name="groupId" type="long" />

			<!-- Audit fields -->

			<column name="companyId" type="long" />
			<column name="userId" type="long" />
			<column name="userName" type="String" />
			<column name="createDate" type="Date" />
			<column name="modifiedDate" type="Date" />

			<!-- Other fields -->

			<column name="description" type="String" />
			<column name="name" type="String" />

			<!-- Order -->

			<order by="desc">
				<order-column name="createDate" />
			</order>
		</entity>
		<exceptions>
			<exception>DuplicateH7G5EntryKey</exception>
			<exception>H7G5FolderName</exception>
		</exceptions>
	</service-builder>
	```

1. Type ***./gradlew :h7g5-service:buildService***. The ***buildService*** task takes service.xml as the input file and generates many files.

	```
	Building H7G5Entry
	Writing src/main/java/com/liferay/h7g5/service/persistence/impl/H7G5EntryPersistenceImpl.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/persistence/H7G5EntryPersistence.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/persistence/H7G5EntryUtil.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5EntryModelImpl.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5EntryBaseImpl.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5EntryImpl.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5EntryModel.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5Entry.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5EntryCacheModel.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5EntryWrapper.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5EntrySoap.java
	Writing src/main/java/com/liferay/h7g5/service/impl/H7G5EntryLocalServiceImpl.java
	Writing src/main/java/com/liferay/h7g5/service/base/H7G5EntryLocalServiceBaseImpl.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/H7G5EntryLocalService.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/H7G5EntryLocalServiceUtil.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/H7G5EntryLocalServiceWrapper.java
	Building H7G5Folder
	Writing src/main/java/com/liferay/h7g5/service/persistence/impl/H7G5FolderPersistenceImpl.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/persistence/H7G5FolderPersistence.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/persistence/H7G5FolderUtil.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5FolderModelImpl.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5FolderBaseImpl.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5FolderImpl.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5FolderModel.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5Folder.java
	Writing src/main/java/com/liferay/h7g5/model/impl/H7G5FolderCacheModel.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5FolderWrapper.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/model/H7G5FolderSoap.java
	Writing src/main/java/com/liferay/h7g5/service/impl/H7G5FolderLocalServiceImpl.java
	Writing src/main/java/com/liferay/h7g5/service/base/H7G5FolderLocalServiceBaseImpl.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/H7G5FolderLocalService.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/H7G5FolderLocalServiceUtil.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/service/H7G5FolderLocalServiceWrapper.java
	Writing src/main/resources/META-INF/module-hbm.xml
	Writing src/main/resources/META-INF/portlet-model-hints.xml
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/exception/DuplicateH7G5EntryKeyException.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/exception/H7G5FolderNameException.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/exception/NoSuchH7G5EntryException.java
	Writing ../h7g5-api/src/main/java/com/liferay/h7g5/exception/NoSuchH7G5FolderException.java
	Writing src/main/java/com/liferay/h7g5/service/persistence/impl/constants/OHQIWTSFHLPersistenceConstants.java
	Writing src/main/resources/META-INF/sql/indexes.sql
	Writing src/main/resources/META-INF/sql/tables.sql
	Writing src/main/resources/META-INF/sql/tables.sql
	Writing src/main/resources/META-INF/sql/tables.sql
	Writing src/main/resources/service.properties
	```	

	The file paths are relative to h7g5-service. Open up these files with Sublime. Some files are obvious in what they do (e.g. tables.sql). Some files are less obvious (e.g. H7G5FolderSoap.java). That's OK. Just look at them so they are logged in your mind.

1. Type ***./gradlew classes*** to make sure the generated files compile.

1. In MySQL, type ***show tables;***.

	1. Type ***desc User;***.

	1. Type ***desc SomeInvalidTableName;***

	1. Type ***desc OHQIWTSFHL_H7G5Entry;***. Where did I get this name from? The table does not yet exist.

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay*** to deploy h7g5-api and h7g5-service.

1. Verify on the Liferay console that ***com.liferay.h7g5.service*** could not resolve.

	```
	2021-03-25 11:19:08.675 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.liferay.h7g5.api_1.0.0 [1355]
	2021-03-25 11:19:08.682 ERROR [fileinstall-directory-watcher][DirectoryWatcher:1136] Unable to start bundle: file:/opt/liferay/osgi/modules/com.liferay.h7g5.service-1.0.0.jar
	org.osgi.framework.BundleException: Could not resolve module: com.liferay.h7g5.service [1356]_  Unresolved requirement: Import-Package: com.liferay.h7g5.exception_ [Sanitized]
		at org.eclipse.osgi.container.Module.start(Module.java:444)
		at org.eclipse.osgi.internal.framework.EquinoxBundle.start(EquinoxBundle.java:428)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundle(DirectoryWatcher.java:1119)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundles(DirectoryWatcher.java:1152)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._process(DirectoryWatcher.java:1014)
		at com.liferay.portal.file.install.internal.DirectoryWatcher.run(DirectoryWatcher.java:265)	
	```

	The module ***com.liferay.h7g5.service*** could not resolve because it requires the package ***com.liferay.h7g5.exception***. How can we fix this exception?

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	```
	2021-03-25 11:22:59.144 ERROR [fileinstall-directory-watcher][DirectoryWatcher:1136] Unable to start bundle: file:/opt/liferay/osgi/modules/com.liferay.h7g5.service-1.0.0.jar
	org.osgi.framework.BundleException: Could not resolve module: com.liferay.h7g5.service [1356]_  Unresolved requirement: Import-Package: com.liferay.h7g5.model_ [Sanitized]
		at org.eclipse.osgi.container.Module.start(Module.java:444)
		at org.eclipse.osgi.internal.framework.EquinoxBundle.start(EquinoxBundle.java:428)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundle(DirectoryWatcher.java:1119)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundles(DirectoryWatcher.java:1152)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._process(DirectoryWatcher.java:1014)
		at com.liferay.portal.file.install.internal.DirectoryWatcher.run(DirectoryWatcher.java:265)	
	```

	The module ***com.liferay.h7g5.service*** is not able to resolve because it is missing the package ***com.liferay.h7g5.model***.


1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	```
	2021-03-25 11:24:04.328 ERROR [fileinstall-directory-watcher][DirectoryWatcher:1136] Unable to start bundle: file:/opt/liferay/osgi/modules/com.liferay.h7g5.service-1.0.0.jar
	org.osgi.framework.BundleException: Could not resolve module: com.liferay.h7g5.service [1356]_  Unresolved requirement: Import-Package: com.liferay.h7g5.service_ [Sanitized]
		at org.eclipse.osgi.container.Module.start(Module.java:444)
		at org.eclipse.osgi.internal.framework.EquinoxBundle.start(EquinoxBundle.java:428)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundle(DirectoryWatcher.java:1119)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundles(DirectoryWatcher.java:1152)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._process(DirectoryWatcher.java:1014)
		at com.liferay.portal.file.install.internal.DirectoryWatcher.run(DirectoryWatcher.java:265)	
	```

	The module ***com.liferay.h7g5.service*** is not able to resolve because it is missing the package ***com.liferay.h7g5.service***. This error can be confusing because the name of the missing package that is provided by the module ***com.liferay.h7g5.api*** happens to be the same name as the module ***com.liferay.h7g5.service***.

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	```
	2021-03-25 11:27:19.767 ERROR [fileinstall-directory-watcher][DirectoryWatcher:1136] Unable to start bundle: file:/opt/liferay/osgi/modules/com.liferay.h7g5.service-1.0.0.jar
	org.osgi.framework.BundleException: Could not resolve module: com.liferay.h7g5.service [1356]_  Unresolved requirement: Import-Package: com.liferay.h7g5.service.persistence_ [Sanitized]
		at org.eclipse.osgi.container.Module.start(Module.java:444)
		at org.eclipse.osgi.internal.framework.EquinoxBundle.start(EquinoxBundle.java:428)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundle(DirectoryWatcher.java:1119)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundles(DirectoryWatcher.java:1152)
		at com.liferay.portal.file.install.internal.DirectoryWatcher._process(DirectoryWatcher.java:1014)
		at com.liferay.portal.file.install.internal.DirectoryWatcher.run(DirectoryWatcher.java:265)
	```

	The module ***com.liferay.h7g5.service*** is not able to resolve because it is missing the package ***com.liferay.h7g5.service.persistence***.

1. Verify on the Liferay console that both modules started.

	```
	2021-03-25 11:28:34.961 INFO  [Refresh Thread: Equinox Container: 743d7fd3-e7c1-438a-9dee-b8ecf6e55aa2][BundleStartStopLogger:46] STARTED com.liferay.h7g5.api_1.0.0 [1355]
	2021-03-25 11:28:34.962 INFO  [Refresh Thread: Equinox Container: 743d7fd3-e7c1-438a-9dee-b8ecf6e55aa2][BundleStartStopLogger:46] STARTED com.liferay.h7g5.service_1.0.0 [1356]
	```

1. To get the ***com.liferay.h7g5.service*** to resolve, you had to modify h7g5-api/build.gradle with the following new line.

 	```
 	Export-Package: com.liferay.h7g5.exception, com.liferay.h7g5.model, com.liferay.h7g5.service, com.liferay.h7g5.service.persistence
 	```

 	That can look ugly if you have to import many packages. Try formatting it like the following.

 	```
 	Bundle-Name: Liferay H7G5 API
	Bundle-SymbolicName: com.liferay.h7g5.api
	Bundle-Version: 1.0.0
	Export-Package:\
		com.liferay.h7g5.exception,\
		com.liferay.h7g5.model,\
		com.liferay.h7g5.service,\
		com.liferay.h7g5.service.persistence
	```

1. Go to MySQL and type ***desc OHQIWTSFHL_H7G5Entry;***. The table is still missing.

1. Add the following line to ***h7g5-service/bnd.bnd***.

	```
	Liferay-Service: true
	```

	This property tells Liferay to process ***com.liferay.h7g5.service*** as a Service Builder module. Be very careful not to accidentally add this line to ***h7g5-api/bnd.bnd***

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

1. Go to MySQL and type ***desc OHQIWTSFHL_H7G5Entry;***. The table was created.

	1. Type ***select * from OHQIWTSFHL_H7G5Entry;***.

	1. Type ***desc OHQIWTSFHL_H7G5Folder;***.

	1. Type ***select * from OHQIWTSFHL_H7G5Folder;***.

## Invoke Service Builder from a Portlet