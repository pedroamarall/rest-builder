# REST Builder

## JSONWS

[JSONWS](https://help.liferay.com/hc/en-us/articles/360018151631-JSON-Web-Services) is a form of [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call) over HTTP that allows clients to invoke methods on ***remote*** services provided by Service Builder. Entities in Service Builder represent database tables. Therefore, the JSONWS API is tightly coupled to how data is represented in the database.

## REST

Read about [REST](https://www.codecademy.com/articles/what-is-rest) and its relationship to [CRUD](https://www.codecademy.com/articles/what-is-crud).

## REST vs. RPC

Read about [REST and RPC](https://stackoverflow.com/questions/26830431/web-service-differences-between-rest-and-rpc) to understand their differences. A fork is different from a spoon, and one is not necessarily better than the other.
 
## OpenAPI

[OpenAPI](https://spec.openapis.org/oas/v3.1.0) is a specification for describing REST APIs. Read this introductory [tutorial](https://support.smartbear.com/swaggerhub/docs/tutorials/openapi-3-tutorial.html).

## REST Builder

1. REST Builder is a code generator. Its main input files are ***rest-config.yaml*** and ***rest-openapi.yaml***. It outputs Java code that makes it easier for developers to write REST APIs.

1. Type ***svn export https://github.com/liferay/liferay-learn/trunk/docs/dxp/7.x/en/headless-delivery/producing-apis-with-rest-builder/implementing-a-new-api-with-rest-builder/resources/liferay-r3b2.zip***.

	This will create a directory called liferay-r3b2.zip. It is a little confusing because this directory is not actually a zip file.

	1. Type ***cd liferay-r3b2.zip***. Notice that this directory already contains a lot of build.gradle and Java files. However, the directory is not yet fully setup as a Gradle project.

	1. Follow the steps in [Set Up an OSGi Project](../osgi#set-up-an-osgi-project) to set up liferay-r3b2.zip.

1. Type ***osub headless-r3b2-impl/rest-config.yaml***.

	This file contains basic information about the API that will be generated.

1. Type ***osub headless-r3b2-impl/rest-openapi.yaml***.

	This file contains the OpenAPI definition of the API describing the schemas Foo and Goo and their available interactions.

1. Type ***./gradlew headless-r3b2-impl:classes***.

	There are a lot of compile errors.

1. Type ***rm -fr headless-r3b2-impl/src/main/java/com*** to delete some of the Java files that are not yet compileable.

1. Type ***./gradlew headless-r3b2-impl:classes***.

1. Type ***./gradlew headless-r3b2-impl:buildREST***.

	```
	> Task :headless-r3b2-impl:buildREST
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/jaxrs/application/HeadlessR3B2Application.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/aggregation/Aggregation.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/json/BaseJSONParser.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/aggregation/Facet.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/http/HttpInvoker.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/pagination/Page.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/pagination/Pagination.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/permission/Permission.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/problem/Problem.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/function/UnsafeSupplier.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/graphql/mutation/v1_0/Mutation.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/graphql/query/v1_0/Query.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/graphql/servlet/v1_0/ServletDataImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/OpenAPIResourceImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/resources/OSGI-INF/liferay/rest/v1_0/openapi.properties
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-api/src/main/java/com/acme/headless/r3b2/dto/v1_0/Goo.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/dto/v1_0/Goo.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/serdes/v1_0/GooSerDes.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-api/src/main/java/com/acme/headless/r3b2/dto/v1_0/Foo.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/dto/v1_0/Foo.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/serdes/v1_0/FooSerDes.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/BaseFooResourceImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/resources/OSGI-INF/liferay/rest/v1_0/foo.properties
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/factory/FooResourceFactoryImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-api/src/main/java/com/acme/headless/r3b2/resource/v1_0/FooResource.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/FooResourceImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/resource/v1_0/FooResource.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-test/src/testIntegration/java/com/acme/headless/r3b2/resource/v1_0/test/BaseFooResourceTestCase.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/BaseGooResourceImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/resources/OSGI-INF/liferay/rest/v1_0/goo.properties
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/factory/GooResourceFactoryImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-api/src/main/java/com/acme/headless/r3b2/resource/v1_0/GooResource.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/GooResourceImpl.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-client/src/main/java/com/acme/headless/r3b2/client/resource/v1_0/GooResource.java
	Writing /home/me/dev/projects/github/liferay-basic-training/liferay-r3b2.zip/headless-r3b2-test/src/testIntegration/java/com/acme/headless/r3b2/resource/v1_0/test/BaseGooResourceTestCase.java
	```

1. Open up ***FooResource.java*** and ***FooResourceImpl.java***.

	The file ***FooResource.java*** contains the ***@generated*** annotation. This file is always regenerated when you run the ***buildREST*** task. Do not modify this file.

	The file ***FooResourceImpl.java*** does not contain the ***@generated*** annotation. This file is only generated if it does not already exist. We need to implement methods in this file.

	\*ResourceImpl.java files in REST Builder are similar to \*ServiceImpl.java files in Service Builder because they are not regenerated and are meant for the developer to implement. Unlike Service Builder, REST Builder only has remote implementations (remote resources are like remote services).

1. Open up ***GooResource.java*** and ***GooResourceImpl.java***.

	The file ***GooResource.java*** contains the ***@generated*** annotation. This file is always regenerated when you run the ***buildREST*** task. Do not modify this file.

	The file ***GooResourceImpl.java*** does not contain the ***@generated*** annotation. This file is only generated if it does not already exist. We need to implement methods in this file.

1. Type ***./gradlew headless-r3b2-impl:classes***.

1. Delete FooResourceImpl.java and GooResourceImpl.java.

1. Type ***./gradlew headless-r3b2-impl:classes***. Notice the compile errors.

1. Type ***wget https://github.com/liferay/liferay-learn/raw/master/docs/dxp/7.x/en/headless-delivery/producing-apis-with-rest-builder/implementing-a-new-api-with-rest-builder/resources/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/FooResourceImpl.java -P headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0***.

	Open up the new ***FooResourceImpl.java***.

1. Type ***wget https://github.com/liferay/liferay-learn/raw/master/docs/dxp/7.x/en/headless-delivery/producing-apis-with-rest-builder/implementing-a-new-api-with-rest-builder/resources/liferay-r3b2.zip/headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/GooResourceImpl.java -P headless-r3b2-impl/src/main/java/com/acme/headless/r3b2/internal/resource/v1_0***.

	Open up the new ***GooResourceImpl.java***.

1. Type ***./gradlew headless-r3b2-impl:classes***.

1. Study ***FooResourceImpl.java*** and ***GooResourceImpl.java***. Notice that every public method incluces an ***@Override*** annotation. Open up ***BaseFooResourceImpl.java*** and ***BaseGooResourceImpl.java***. Those are generated files that map to ***rest-openapi.yaml***.

1. Go to http://localhost:8080/o/api. Go to ***REST Applications*** and look for ***headless-r3b2/v1.0***. Why are you not able to find it?

1. Type ***./gradlew headless-r3b2-api:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	1. Type ***./gradlew headless-r3b2-impl:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	1. Do not deploy the headless-r3b2-client and headless-r3b2-test.

1. Go to http://localhost:8080/o/api. Go to ***REST Applications*** and look for ***headless-r3b2/v1.0***.

	1. Use the GUI to access every endpoint related to foos and goos.

	1. Use curl to access every endpoint related to foos and goos.

## Client Resource

1. Use the client JAR to access Headless R3B2 1.0.

	1. Type ***la***.

		```
		drwxrwxr-x 1 me me  398 Mar 31 13:29 .
		drwxrwxr-x 1 me me   32 Mar 30 08:32 ..
		drwxrwxr-x 1 me me  112 Mar 26 21:22 .gradle
		drwxrwxr-x 1 me me   14 Mar 26 21:22 gradle
		drwxrwxr-x 1 me me   54 Mar 30 08:11 headless-r3b2-api
		drwxrwxr-x 1 me me   54 Mar 30 08:28 headless-r3b2-client
		drwxrwxr-x 1 me me  120 Mar 30 08:28 headless-r3b2-impl
		drwxrwxr-x 1 me me   78 Mar 30 21:30 headless-r3b2-test
		drwxrwxr-x 1 me me    0 Mar 31 13:29 not-a-gradle-project
		-rw-rw-r-- 1 me me  645 Mar 30 21:30 .gitignore
		-rw-rw-r-- 1 me me   40 Mar 30 14:39 gradle.properties
		-rwxrwxr-x 1 me me 5766 Mar 30 14:39 gradlew
		-rw-rw-r-- 1 me me 2674 Mar 30 14:39 gradlew.bat
		-rw-rw-r-- 1 me me  301 Mar 30 14:39 settings.gradle
		-rw-rw-r-- 1 me me  219 Mar 30 14:39 source-formatter-suppressions.xml
		```

	1. Type ***la headless-r3b2-client/build/libs***.

	1. Type ***./gradlew headless-r3b2-client:jar***.

	1. Type ***la headless-r3b2-client/build/libs***.

	1. Type ***mkdir not-a-gradle-project && cd not-a-gradle-project***.

	1. Type ***osub Test.java*** and paste the following code.

		```
		import com.acme.headless.r3b2.client.dto.v1_0.Foo;
		import com.acme.headless.r3b2.client.resource.v1_0.FooResource;

		public class Test {

			public static void main(String[] args) throws Exception {
				FooResource.Builder builder = FooResource.builder();

				FooResource fooResource = builder.authentication(
					"test@liferay.com", "test"
				).build();

				Foo foo = fooResource.getFoo(1L);

				System.out.println(foo);
			}

		}
		```

	1. Compile the Java file. You will need to add ***../headless-r3b2-client/build/libs/com.acme.headless.r3b2.client-1.0.0.jar*** to the ***-classpath*** argument.

		<!--
		javac -classpath .:../headless-r3b2-client/build/libs/\* \*.java
		-->

	1. Run the Java class.

		<!--
		java -classpath .:../headless-r3b2-client/build/libs/* Test
		-->

	1. Modify the Java file to use the client JAR to access every endpoint related to foos and goos.

	1. Send a pull request to ***brianchandotcom*** of your modified Test.java file.

1. Use the client JAR to access Headless Delivery 1.0.

	1. Go to http://localhost:8080/o/api. Go to ***REST Applications*** and look for ***headless-delivery/v1.0***.

	1. Find the Java client JAR version. Look for text like the following.

	```A Java client JAR is available for use with the group ID 'com.liferay', artifact ID 'com.liferay.headless.delivery.client', and version '3.0.10'.```

	Your version may not be 3.0.10. Find the correct client version for your Liferay version.

	1. Go to https://repository.liferay.com/nexus/content/groups/public/com/liferay/com.liferay.headless.delivery.client.

	1. Click on your version number. Download com.liferay.headless.delivery.client-3.0.10.jar (replace 3.0.10 with your version number).

	1. Download com.liferay.headless.delivery.client-3.0.10-sources.jar. Type ***xarchiver com.liferay.headless.delivery.client-3.0.10-sources.jar*** to examine the source code in the JAR.

	1. Modify Test.java to test the CRUD operations of knowledge base folders and articles.

		1. Go to MySQL and type ***select \* from KBArticle;*** and ***select \* from KBFolder;*** to verify your CRUD operations.

		1. Go to the Knowledge Base widget to verify your CRUD operations.

	1. Do the same for document library folders and documents.

	1. Send a pull request to ***brianchandotcom*** of your modified Test.java file.

1. Type ***cd ..***.

## OSGi Resource

1. Client resources are invoked over HTTP. OSGi resources are invoked within the same [JVM](https://en.wikipedia.org/wiki/Java_virtual_machine). What is a [benefit](https://stackoverflow.com/questions/7538951/what-is-the-performance-difference-between-a-jvm-method-call-and-a-remote-call) of invoking within the JVM versus invoking over HTTP?

1. Create ***headless-r3b2-web***.

1. Create ***com.acme.headless.r3b2.web.internal.R3B2Portlet***.

1. For Test.java, we used ***com.acme.headless.r3b2.client.resource.v1_0.FooResource*** from ***headless-r3b2-client/src/main/java***. For R3B2Portlet.java, use ***com.acme.headless.r3b2.resource.v1_0.FooResource*** from ***headless-r3b2-api/src/main/java***. Notice that the Java packages are different.

	1. Add a reference to ***FooResource.Factory***.

		```
		@Reference
		private FooResource.Factory _fooResourceFactory;
		```

	1. Add the following snippet in the ***doView*** method of ***R3B2Portlet.java*** to get an instance of ***FooResource***.

		```
		ThemeDisplay themeDisplay = (ThemeDisplay)renderRequest.getAttribute(
			WebKeys.THEME_DISPLAY);

		FooResource.Builder fooResourceBuilder = _fooResourceFactory.create();

		FooResource fooResource = fooResourcedBuilder.user(
			themeDisplay.getUser()
		).build();
		```

	1. Use ***fooResource*** to access every endpoint related to foos and goos.

	1. Send a pull request to ***brianchandotcom*** of your R3B2Portlet.java file.

1. Go to http://docs.liferay.com/portal/7.3-ga7/apps/headless-3.0.5/javadocs.

	1. Use ***com.liferay.headless.delivery.resource.v1_0*** to test the CRUD operations of knowledge base folders and articles.

		1. Go to MySQL and type ***select \* from KBArticle;*** and ***select \* from KBFolder;*** to verify your CRUD operations.

		1. Go to the Knowledge Base widget to verify your CRUD operations.

	1. Do the same for document library folders and documents.

	1. Send a pull request to ***brianchandotcom*** of your modified Test.java file.

## Test