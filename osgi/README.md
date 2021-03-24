# OSGi

## Set Up an OSGi Project

1. Type ***mkdir my-osgi-project && cd my-osgi-project***.

1. Install Gradle.

	1. Type ***wget https://github.com/liferay/liferay-learn/raw/master/docs/_template/java/gradlew && chmod u+x gradlew && mkdir -p gradle/wrapper && wget https://github.com/liferay/liferay-learn/raw/master/docs/_template/java/gradle/wrapper/gradle-wrapper.jar -P gradle/wrapper && wget https://github.com/liferay/liferay-learn/raw/master/docs/_template/java/gradle/wrapper/gradle-wrapper.properties -P gradle/wrapper***.

1. Configure Gradle for your project.

	1. Type ***wget https://github.com/liferay/liferay-learn/raw/master/docs/_template/java/settings.gradle***.

	1. Type ***more settings.gradle***.

		```
		buildscript {
			dependencies {
				classpath group: "com.liferay", name: "com.liferay.gradle.plugins.workspace", version: "latest.release"
			}

			repositories {
				mavenLocal()

				maven {
					url "https://repository-cdn.liferay.com/nexus/content/groups/public"
				}
			}
		}

		apply plugin: "com.liferay.workspace"
		```

		This settings file applies the ***com.liferay.workspace*** Gradle plugin. That means this OSGi project is a Liferay Workspace project.

		The ***repositories*** block also configures Maven Central and Liferay's Maven repository for third party JAR files.

	1. Type ***echo "liferay.workspace.product=portal-7.3-ga7" > gradle.properties*** to configure Liferay Workspace to work with a specific version of Liferay.

## My First Module

1. Type ***mkdir -p basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator***.

1. Type ***osub basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java*** and paste the following code.

	```
	package com.liferay.basic.training.able.internal.activator;

	public class AbleBundleActivator {

		public AbleBundleActivator() {
			System.out.println("Constructing AbleBundleActivator");
		}

	}
	```

1. Type ***./gradlew classes***.

	```
	Deprecated Gradle features were used in this build, making it incompatible with Gradle 7.0.
	Use '--warning-mode all' to show the individual deprecation warnings.
	See https://docs.gradle.org/6.6.1/userguide/command_line_interface.html#sec:command_line_warnings

	BUILD SUCCESSFUL in 1s
	```

	You can ignore the deprecation warnings.

1. Type ***la*** and ***la basic-training-able-impl***.

	Notice that even though you told Gradle to compile, no build directory was created.

1. Type ***osub basic-training-able-impl/bnd.bnd*** and paste the following code.

	```
	Bundle-Name: Liferay Basic Training Able Implementation
	Bundle-SymbolicName: com.liferay.basic.training.able.impl
	Bundle-Version: 1.0.0
	```

	This contains basic metadata required for OSGi modules.

1. Type ***./gradlew classes***.

	```
	FAILURE: Build failed with an exception.

	* What went wrong:
	A problem occurred configuring project ':basic-training-able-impl'.
	> Extension of type 'LiferayExtension' does not exist. Currently registered extension types: [ExtraPropertiesExtension, BundleExtension]

	* Try:
	Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

	* Get more help at https://help.gradle.org

	BUILD FAILED in 1s
	```

1. Type ***touch basic-training-able-impl/build.gradle***.

	A build.gradle file tells Liferay Workspace that this directory is a Java module.

1. Type ***la basic-training-able-impl***.

	```
	drwxrwxr-x 1 me me  54 Mar 22 09:34 .
	drwxrwxr-x 1 me me 152 Mar 22 09:19 ..
	drwxrwxr-x 1 me me   8 Mar 22 09:18 src
	-rw-r--r-- 1 me me 135 Mar 22 09:31 bnd.bnd
	-rw-rw-r-- 1 me me   0 Mar 22 09:34 build.gradle
	```

1. Type ***./gradlew classes***.

1. Type ***la basic-training-able-impl***.

	```
	drwxrwxr-x 1 me me  54 Mar 22 09:34 .
	drwxrwxr-x 1 me me 152 Mar 22 09:19 ..
	drwxrwxr-x 1 me me  38 Mar 22 09:34 build
	drwxrwxr-x 1 me me   8 Mar 22 09:18 src
	-rw-r--r-- 1 me me 135 Mar 22 09:31 bnd.bnd
	-rw-rw-r-- 1 me me   0 Mar 22 09:34 build.gradle
	```

	Notice the newly created build directory.

	The compiled Java classes are located in ***basic-training-able-impl/build/classes/java/main***.

1. Type ***./gradlew deploy*** to deploy your new module.

	```
	> Task :basic-training-able-impl:deploy
	Files of project ':basic-training-able-impl' deployed to /home/me/dev/projects/github/liferay-basic-training/my-osgi-project/bundles/osgi/modules

	BUILD SUCCESSFUL in 1s
	4 actionable tasks: 3 executed, 1 up-to-date
	```

	Where is your new module?

1. Your newly created module ***com.liferay.basic.training.able.impl.jar*** is not yet read by Liferay.

1. Type ***d run --name ephesians-liferay --rm -it -p 8080:8080 liferay/portal:7.3.6-ga7*** to start Liferay.

	The ***--name*** flag means the Liferay container can be referenced as ***ephesians-liferay***.

	The ***--rm*** flag means that this Docker image is transient and will be removed (and not remembered) as soon as you kill the process.

1. Type ***d exec -it ephesians-liferay /bin/ls /opt/liferay/osgi***. Notice that this command lists the directories and files in ***/opt/liferay/osgi*** on the container.

	1. You can even SSH into the container by typing ***d exec -it ephesians-liferay /bin/bash***.

		```
		liferay@30f7e46500b9 /opt/liferay
		```

		The long hash ***30f7e46500b9*** is the container ID. The name ***ephesians-liferay*** is mapped to the long hash ***30f7e46500b9***.

	1. Type ***exit*** to get out of the container.

	1. Type ***d ps***.

		```
		CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS                   PORTS                                                   NAMES
		30f7e46500b9        liferay/portal:7.3.6-ga7   "/bin/sh -c /usr/loc…"   3 minutes ago       Up 3 minutes (healthy)   8000/tcp, 8009/tcp, 11311/tcp, 0.0.0.0:8080->8080/tcp   ephesians-liferay
		```

		Notice that the Docker process command shows that the container ***30f7e46500b9*** is mapped to the name ***ephesians-liferay***.

1. Type ***d exec -it ephesians-liferay /bin/ls /opt/liferay/osgi/modules*** to see that the directory is empty.

1. Type ***d cp bundles/osgi/modules/com.liferay.basic.training.able.impl.jar ephesians-liferay:/opt/liferay/osgi/modules***.

1. Type ***d exec -it ephesians-liferay /bin/ls /opt/liferay/osgi/modules*** to see that the directory contains the file ***com.liferay.basic.training.able.impl.jar***.

1. Go to the tab that started the Liferay docker container to verify on the console that the module ***com.liferay.basic.training.able.impl*** was started.

	```
	2021-03-22 12:59:58.258 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1355]
	```

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay*** to deploy directly to the Liferay Docker container.

1. Type ***d exec -it ephesians-liferay /bin/ls /opt/liferay/osgi/modules*** to see that the directory contains the file ***com.liferay.basic.training.able.impl-1.0.0.jar*** and the file ***com.liferay.basic.training.able.impl.jar***.

	This is very BAD and makes it so that the OSGi container behaves unpredictably. We should avoid ever having two versions of the same JAR file.

	Type ***<Control+C>*** to stop Liferay.

1. Start Liferay. This is a new container.

1. Type ***osub basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java*** and paste the following code.

	```
	package com.liferay.basic.training.able.internal.activator;

	import org.osgi.framework.BundleActivator;
	import org.osgi.framework.BundleContext;

	public class AbleBundleActivator implements BundleActivator {

		public AbleBundleActivator() {
			System.out.println("Constructing AbleBundleActivator");
		}

		@Override
		public void start(BundleContext bundleContext) throws Exception {
			System.out.println("Starting AbleBundleActivator");
		}

		@Override
		public void stop(BundleContext bundleContext) throws Exception {
			System.out.println("Stopping AbleBundleActivator");
		}

	}
	```

1. Type ***./gradlew classes***.

	```
	> Task :basic-training-able-impl:compileJava FAILED
	/home/me/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java:3: error: package org.osgi.framework does not exist
	import org.osgi.framework.BundleActivator;
	                         ^
	/home/me/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java:4: error: package org.osgi.framework does not exist
	import org.osgi.framework.BundleContext;
	                         ^
	/home/me/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java:6: error: cannot find symbol
	public class AbleBundleActivator implements BundleActivator {
	                                            ^
	  symbol: class BundleActivator
	/home/me/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java:13: error: cannot find symbol
	        public void start(BundleContext bundleContext) throws Exception {
	                          ^
	  symbol:   class BundleContext
	  location: class AbleBundleActivator
	/home/me/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java:18: error: cannot find symbol
	        public void stop(BundleContext bundleContext) throws Exception {
	                         ^
	  symbol:   class BundleContext
	  location: class AbleBundleActivator
	/home/me/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java:12: error: method does not override or implement a method from a supertype
	        @Override
	        ^
	/home/me/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/activator/AbleBundleActivator.java:17: error: method does not override or implement a method from a supertype
	        @Override
	        ^
	7 errors

	FAILURE: Build failed with an exception.

	* What went wrong:
	Execution failed for task ':basic-training-able-impl:compileJava'.
	> Compilation failed; see the compiler error output for details.

	* Try:
	Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

	* Get more help at https://help.gradle.org

	BUILD FAILED in 1s
	1 actionable task: 1 executed
	```

1. Type ***osub basic-training-able-impl/build.gradle*** and paste the following code.

	```
	dependencies {
		compileOnly group: "com.liferay.portal", name: "release.portal.api"
	}
	```

1. Type ***./gradlew classes***.

1. Type ***d exec -it ephesians-liferay /bin/ls /opt/liferay/osgi/modules*** to see that the directory is empty.

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

1. Type ***d exec -it ephesians-liferay /bin/ls /opt/liferay/osgi/modules*** to see that the directory contains only the file ***com.liferay.basic.training.able.impl-1.0.0.jar***.

1. Verify on the console that the module ***com.liferay.basic.training.able.impl*** was started.

	```
	2021-03-22 16:14:09.422 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1355]
	```

1. Type ***d exec -it ephesians-liferay /bin/rm /opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar***.

1. Type ***d exec -it ephesians-liferay /bin/ls /opt/liferay/osgi/modules*** to see that the directory is empty.

1. Verify on the console that the module ***com.liferay.basic.training.able.impl*** was stopped.

	```
	2021-03-22 16:14:34.462 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.able.impl_1.0.0 [1355]
	```

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

1. Verify on the console ***basic.training.able.impl*** was started.

	```
	2021-03-22 16:14:59.567 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1356]
	```

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	1. Go to the tab that started the Liferay docker container and verify that nothing happened. Why? The OSGi container detected that the file ***/opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar*** did not actually change.

	1. Type ***md5sum basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar***.

		```
		35b8eb8bbfc376b01e21598c71b29faf  basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar
		```

		Type ***d exec -it ephesians-liferay /usr/bin/md5sum /opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar***.

		```
		35b8eb8bbfc376b01e21598c71b29faf  /opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar
		```

		Notice that MD5 hashes are the same.

	1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay*** again. Run the ***md5sum*** commands again and notice that the hashes did not change. Gradle checks for staleness before making a new JAR file.

	1. Type ***rm basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar*** to force Gradle to recompile.

	1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	1. Type ***md5sum basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar***.

		```
		d7ffa168935514e70c3579ec957c50c8  basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar
		```

		Type ***d exec -it ephesians-liferay /usr/bin/md5sum /opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar***.

		```
		d7ffa168935514e70c3579ec957c50c8  /opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar
		```

		Notice that MD5 hashes are now d7ffa168935514e70c3579ec957c50c8 and not 35b8eb8bbfc376b01e21598c71b29faf. That means the file ***com.liferay.basic.training.able.impl-1.0.0.jar*** was updated.

	1. Verify on the console that the module ***com.liferay.basic.training.able.impl*** was stopped and a new version of the module was started.

		```
		2021-03-22 16:16:59.772 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.able.impl_1.0.0 [1356]
		2021-03-22 16:16:59.828 INFO  [Refresh Thread: Equinox Container: 82f33af4-b229-4921-a9cc-cd5350b6759e][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1356]
		```

1. Configure the module to use ***com.liferay.basic.training.able.internal.activator.AbleBundleActivator*** as the bundle activator by adding following line to the very top of bnd.bnd.

	```
	Bundle-Activator: com.liferay.basic.training.able.internal.activator.AbleBundleActivator
	```

	Without it, the constructor, and the start and stop methods will not be invoked.

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	```
	2021-03-22 16:18:35.004 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.able.impl_1.0.0 [1356]
	Constructing AbleBundleActivator
	Starting AbleBundleActivator
	2021-03-22 16:18:35.053 INFO  [Refresh Thread: Equinox Container: 82f33af4-b229-4921-a9cc-cd5350b6759e][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1356]
	```

	Notice the statements ***Constructing AbleBundleActivator*** and ***Starting AbleBundleActivator*** were printed. The statement ***Stopping AbleBundleActivator*** was not printed becasue the earlier bundle that was stopped did not have the bundle activator wired yet via bnd.bnd.

1. Type ***rm basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar*** to force Gradle to recompile.

1. Type ***./gradlew deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	```
	Stopping AbleBundleActivator
	2021-03-22 16:19:15.109 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.able.impl_1.0.0 [1356]
	Constructing AbleBundleActivator
	Starting AbleBundleActivator
	2021-03-22 16:19:15.159 INFO  [Refresh Thread: Equinox Container: 82f33af4-b229-4921-a9cc-cd5350b6759e][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1356]
	```

	This time, the statement ***Stopping AbleBundleActivator*** was printed. Why?

1. Type ***./gradlew clean deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	```
	Stopping AbleBundleActivator
	2021-03-22 16:20:00.228 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.able.impl_1.0.0 [1356]
	Constructing AbleBundleActivator
	Starting AbleBundleActivator
	2021-03-22 16:20:00.276 INFO  [Refresh Thread: Equinox Container: 82f33af4-b229-4921-a9cc-cd5350b6759e][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1356]
	```

	The tasks ***clean deploy*** will first clean (delete build objects) before deploying. That means you do not have to manually type ***rm basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar*** to force Gradle to recompile.

## Portlet

1. Type ***mkdir -p basic-training-baker-web/src/main/java/com/liferay/basic/training/baker/web/internal/portlet***.

1. Type ***osub basic-training-baker-web/src/main/java/com/liferay/basic/training/baker/web/internal/portlet/BakerPortlet.java*** and paste the following code.

	```
	package com.liferay.basic.training.baker.web.internal.portlet;

	import java.io.IOException;
	import java.io.PrintWriter;

	import javax.portlet.GenericPortlet;
	import javax.portlet.Portlet;
	import javax.portlet.RenderRequest;
	import javax.portlet.RenderResponse;

	import org.osgi.service.component.annotations.Component;

	@Component(
		property = {
			"com.liferay.portlet.display-category=category.sample",
			"javax.portlet.display-name=Basic Training Baker"
		},
		service = Portlet.class
	)
	public class BakerPortlet extends GenericPortlet {

		public BakerPortlet() {
			System.out.println("Constructing BakerPortlet");
		}

		@Override
		protected void doView(
				RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException {

			System.out.println("Invoking BakerPortlet#doView");

			PrintWriter printWriter = renderResponse.getWriter();

			printWriter.println("Hello, Basic Training Baker!");
		}

	}
	```

1. Type ***osub basic-training-baker-web/bnd.bnd*** and paste the following code.

	```
	Bundle-Name: Liferay Basic Training Baker Web
	Bundle-SymbolicName: com.liferay.basic.training.baker.web
	Bundle-Version: 1.0.0
	```

1. Type ***osub basic-training-baker-web/build.gradle*** and paste the following code.

	```
	dependencies {
		compileOnly group: "com.liferay.portal", name: "release.portal.api"
	}
	```

1. Type ***./gradlew classes*** to compile both ***basic-training-able-impl*** and ***basic-training-baker-web**.

1. Type ***./gradlew basic-training-baker-web:classes*** to only compile ***basic-training-baker-web***. Can you guess how you can compile only ***basic-training-able-impl***? Hint, delete ***basic-training-able-impl/build/classes***.

1. Type ***./gradlew basic-training-baker-web:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

1. Verify on the console that the module ***com.liferay.basic.training.baker.web*** was started.

	```
	2021-03-22 16:55:14.559 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.liferay.basic.training.baker.web_1.0.0 [1357]
	Constructing BakerPortlet
	```

	Notice that you did not have wire a bundle activator.

1. Go to http://localhost:8080. Add a ***widget page***. Add the widget ***Basic Training Baker*** to the page. It will be available under the ***Sample*** category.

	The widget will print out ***Hello, Basic Training Baker!*** on the page.

	Every time you refresh the page, the portlet will render, and will print out the statement ***Invoking BakerPortlet#doView*** on the console.

## API and Impl

1. Write the API interface.

	1. Type ***mkdir -p basic-training-able-api/src/main/java/com/liferay/basic/training/able/number/generator***.

	1. Type ***osub basic-training-able-api/src/main/java/com/liferay/basic/training/able/number/generator/AbleNumberGenerator.java*** and paste the following code.

		```
		package com.liferay.basic.training.able.number.generator;

		public interface AbleNumberGenerator {

			public long generate();

		}
		```

	1. Type ***osub basic-training-able-api/bnd.bnd*** and paste the following code.

		```
		Bundle-Name: Liferay Basic Training Able API
		Bundle-SymbolicName: com.liferay.basic.training.able.api
		Bundle-Version: 1.0.0
		```

	1. Type ***osub basic-training-able-api/build.gradle*** and paste the following code.

		```
		dependencies {
			compileOnly group: "com.liferay.portal", name: "release.portal.api"
		}
		```

	1. Type ***./gradlew basic-training-able-api:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	1. Verify on the console that the module ***com.liferay.basic.training.able.api*** was started.

		```
		2021-03-22 17:42:14.450 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.api_1.0.0 [1358]
		```

1. Write the implementation class.

	1. Type ***mkdir -p basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator***.

	1. Type ***osub basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator/AbleNumberGeneratorImpl.java*** and paste the following code.

		```
		package com.liferay.basic.training.able.internal.number.generator;

		import com.liferay.basic.training.able.number.generator.AbleNumberGenerator;

		import org.osgi.service.component.annotations.Component;

		@Component(
			immediate = true, service = {AbleNumberGenerator.class}
		)
		public class AbleNumberGeneratorImpl implements AbleNumberGenerator {

			public long generate() {
				return 30624700;
			}

		}
		```

	1. Type ***./gradlew basic-training-able-impl:classes***.

		```
		> Task :basic-training-able-impl:compileJava FAILED
		/home/brian/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator/AbleNumberGeneratorImpl.java:3: error: package com.liferay.basic.training.able.number.generator does not exist
		import com.liferay.basic.training.able.number.generator.AbleNumberGenerator;
		                                                       ^
		/home/brian/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator/AbleNumberGeneratorImpl.java:10: error: cannot find symbol
		public class AbleNumberGeneratorImpl implements AbleNumberGenerator {
		                                                ^
		  symbol: class AbleNumberGenerator
		/home/brian/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator/AbleNumberGeneratorImpl.java:8: error: cannot find symbol
		        immediate = true, service = {AbleNumberGenerator.class}
		                                     ^
		  symbol: class AbleNumberGenerator
		3 errors

		FAILURE: Build failed with an exception.

		* What went wrong:
		Execution failed for task ':basic-training-able-impl:compileJava'.
		> Compilation failed; see the compiler error output for details.

		* Try:
		Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

		* Get more help at https://help.gradle.org

		BUILD FAILED in 1s
		1 actionable task: 1 executed
		```

	1. Type ***osub basic-training-able-impl/build.gradle*** and paste the following code.

		```
		dependencies {
			compileOnly group: "com.liferay.portal", name: "release.portal.api"
			compileOnly project(":basic-training-able-api")
		}
		```

		The new line states that the module ***basic-training-able-impl*** depends on ***basic-training-able-api***.

	1. Type ***./gradlew basic-training-able-impl:classes***.

	1. Type ***./gradlew basic-training-able-impl:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

		```
		2021-03-22 18:17:13.235 ERROR [fileinstall-directory-watcher][DirectoryWatcher:1136] Unable to start bundle: file:/opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar
		org.osgi.framework.BundleException: Could not resolve module: com.liferay.basic.training.able.impl [1355]_  Unresolved requirement: Import-Package: com.liferay.basic.training.able.number.generator_ [Sanitized]
			at org.eclipse.osgi.container.Module.start(Module.java:444)
			at org.eclipse.osgi.internal.framework.EquinoxBundle.start(EquinoxBundle.java:428)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundle(DirectoryWatcher.java:1119)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundles(DirectoryWatcher.java:1152)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._startAllBundles(DirectoryWatcher.java:1097)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._process(DirectoryWatcher.java:1009)
			at com.liferay.portal.file.install.internal.DirectoryWatcher.run(DirectoryWatcher.java:265)
		```

	1. Configure ***basic-training-able-api*** to export the package ***com.liferay.basic.training.able.number.generator*** by adding following line to the very bottom of bnd.bnd.

		```
		Export-Package: com.liferay.basic.training.able.number.generator
		```

		Without it, ***basic-training-able-impl*** will not resolve because it requires the package ***com.liferay.basic.training.able.number.generator***.

	1. Type ***./gradlew basic-training-able-api:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

		```
		2021-03-22 20:26:40.986 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.able.api_1.0.0 [1358]
		Constructing AbleBundleActivator
		Starting AbleBundleActivator
		2021-03-22 20:26:41.035 INFO  [Refresh Thread: Equinox Container: b1089b7d-7ea7-4eb1-82df-655d020b9288][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1356]
		2021-03-22 20:26:41.036 INFO  [Refresh Thread: Equinox Container: b1089b7d-7ea7-4eb1-82df-655d020b9288][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.api_1.0.0 [1358]
		```

		Once the new version of ***com.liferay.basic.training.able.api*** started, the package ***com.liferay.basic.training.able.number.generator*** became available, and so ***com.liferay.basic.training.able.impl*** was able to resolve.

1. Invoke the implementation via the API.

	1. Type ***osub basic-training-baker-web/src/main/java/com/liferay/basic/training/baker/web/internal/portlet/BakerPortlet.java*** and paste the following code.

		```
		package com.liferay.basic.training.baker.web.internal.portlet;

		import com.liferay.basic.training.able.number.generator.AbleNumberGenerator;

		import java.io.IOException;
		import java.io.PrintWriter;

		import javax.portlet.GenericPortlet;
		import javax.portlet.Portlet;
		import javax.portlet.RenderRequest;
		import javax.portlet.RenderResponse;

		import org.osgi.service.component.annotations.Component;
		import org.osgi.service.component.annotations.Reference;

		@Component(
			property = {
				"com.liferay.portlet.display-category=category.sample",
				"javax.portlet.display-name=Basic Training Baker"
			},
			service = Portlet.class
		)
		public class BakerPortlet extends GenericPortlet {

			public BakerPortlet() {
				System.out.println("Constructing BakerPortlet");
			}

			@Override
			protected void doView(
					RenderRequest renderRequest, RenderResponse renderResponse)
				throws IOException {

				System.out.println(
					"Invoking BakerPortlet#doView " + _ableNumberGenerator.generate());

				PrintWriter printWriter = renderResponse.getWriter();

				printWriter.println("Hello, Basic Training Baker!");
			}

			@Reference
			private AbleNumberGenerator _ableNumberGenerator;

		}
		```

	1. Type ***./gradlew :basic-training-baker-web:classes***.

		```
		> Task :basic-training-baker-web:compileJava FAILED
		/home/brian/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-baker-web/src/main/java/com/liferay/basic/training/baker/web/internal/portlet/BakerPortlet.java:3: error: package com.liferay.basic.training.able.number.generator does not exist
		import com.liferay.basic.training.able.number.generator.AbleNumberGenerator;
		                                                       ^
		/home/brian/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-baker-web/src/main/java/com/liferay/basic/training/baker/web/internal/portlet/BakerPortlet.java:43: error: cannot find symbol
		        private AbleNumberGenerator _ableNumberGenerator;
		                ^
		  symbol:   class AbleNumberGenerator
		  location: class BakerPortlet
		2 errors

		FAILURE: Build failed with an exception.

		* What went wrong:
		Execution failed for task ':basic-training-baker-web:compileJava'.
		> Compilation failed; see the compiler error output for details.

		* Try:
		Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

		* Get more help at https://help.gradle.org

		BUILD FAILED in 1s
		1 actionable task: 1 executed
		```

		This task failed because ***basic-training-baker-web*** cannot see a package that is only available in ***basic-training-able-api***.

	1. Fix the failure above so that ***basic-training-baker-web*** compiles successfully.

	1. Type ***./gradlew basic-training-baker-web:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

	1. Verify on the console that the module ***com.liferay.basic.training.baker.web*** was restarted.

		```
		2021-03-23 00:43:20.394 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.baker.web_1.0.0 [1357]
		Constructing BakerPortlet
		2021-03-23 00:43:20.507 INFO  [Refresh Thread: Equinox Container: aa880d54-e655-4715-9d9e-496fe3109448][BundleStartStopLogger:46] STARTED com.liferay.basic.training.baker.web_1.0.0 [1357]
		```

	1. Hit refresh on the page with the ***Basic Training Baker*** portlet.

		```
		Invoking BakerPortlet#doView 30624700
		```

1. Why separate the API from the implementation?

	1. Type ***osub basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator/AbleNumberGeneratorImpl.java*** and paste the following code.

		```
		package com.liferay.basic.training.able.internal.number.generator;

		import com.liferay.basic.training.able.number.generator.AbleNumberGenerator;

		import org.apache.commons.math3.util.ArithmeticUtils;

		import org.osgi.service.component.annotations.Component;

		@Component(
			immediate = true, service = {AbleNumberGenerator.class}
		)
		public class AbleNumberGeneratorImpl implements AbleNumberGenerator {

			public long generate() {
				return ArithmeticUtils.mulAndCheck(30624700, 2);
			}

		}
		```

		The new implementation uses Apache Commons Math. Let's use [ArithmeticUtils](http://commons.apache.org/proper/commons-math/javadocs/api-3.6.1/org/apache/commons/math3/util/ArithmeticUtils.html) to multiply 30624700 by 2.

	1. Type ***./gradlew :basic-training-able-impl:classes***.

		```
		> Task :basic-training-able-impl:compileJava FAILED
		/home/brian/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator/AbleNumberGeneratorImpl.java:5: error: package org.apache.commons.math3.util does not exist
		import org.apache.commons.math3.util.ArithmeticUtils;
		                                    ^
		/home/brian/dev/projects/github/liferay-basic-training/my-osgi-project/basic-training-able-impl/src/main/java/com/liferay/basic/training/able/internal/number/generator/AbleNumberGeneratorImpl.java:15: error: cannot find symbol
		                return ArithmeticUtils.mulAndCheck(30624700, 2);
		                       ^
		  symbol:   variable ArithmeticUtils
		  location: class AbleNumberGeneratorImpl
		2 errors

		FAILURE: Build failed with an exception.

		* What went wrong:
		Execution failed for task ':basic-training-able-impl:compileJava'.
		> Compilation failed; see the compiler error output for details.

		* Try:
		Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

		* Get more help at https://help.gradle.org

		Deprecated Gradle features were used in this build, making it incompatible with Gradle 7.0.
		Use '--warning-mode all' to show the individual deprecation warnings.
		See https://docs.gradle.org/6.6.1/userguide/command_line_interface.html#sec:command_line_warnings

		BUILD FAILED in 1s
		3 actionable tasks: 1 executed, 2 up-to-date

		```

		How can we fix this compile error? The Apache Commons Math JAR file is available on [Maven Central](https://mvnrepository.com/artifact/org.apache.commons/commons-math3). Use version 3.6.1.

	1. Type ***osub basic-training-able-impl/build.gradle*** and paste the following code.

		```
		dependencies {
			compileOnly group: "com.liferay.portal", name: "release.portal.api"
			compileOnly group: "org.apache.commons", name: "commons-math3", version: "3.6.1"
			compileOnly project(":basic-training-able-api")
		}
		```

	1. Type ***./gradlew basic-training-able-impl:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

		```
		2021-03-23 01:46:12.570 INFO  [fileinstall-directory-watcher][BundleStartStopLogger:49] STOPPED com.liferay.basic.training.able.impl_1.0.0 [1356]
		2021-03-23 01:46:12.586 ERROR [fileinstall-directory-watcher][DirectoryWatcher:1136] Unable to start bundle: file:/opt/liferay/osgi/modules/com.liferay.basic.training.able.impl-1.0.0.jar
		org.osgi.framework.BundleException: Could not resolve module: com.liferay.basic.training.able.impl [1356]_  Unresolved requirement: Import-Package: org.apache.commons.math3.util; version="[3.6.0,4.0.0)"_ [Sanitized]
			at org.eclipse.osgi.container.Module.start(Module.java:444)
			at org.eclipse.osgi.internal.framework.EquinoxBundle.start(EquinoxBundle.java:428)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundle(DirectoryWatcher.java:1119)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._startBundles(DirectoryWatcher.java:1152)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._startAllBundles(DirectoryWatcher.java:1097)
			at com.liferay.portal.file.install.internal.DirectoryWatcher._process(DirectoryWatcher.java:1009)
			at com.liferay.portal.file.install.internal.DirectoryWatcher.run(DirectoryWatcher.java:265)
		```

		How can we fix this?

	1. Type ***osub basic-training-able-impl/build.gradle*** and paste the following code.

		```
		dependencies {
			compileInclude group: "org.apache.commons", name: "commons-math3", version: "3.6.1"
			compileOnly group: "com.liferay.portal", name: "release.portal.api"
			compileOnly project(":basic-training-able-api")
		}
		```

	1. Type ***xarchiver basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar***. Notice that the three root directories are com, META-INF, and OSGI-INF.

	1. Type ***rm basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar***.

	1. Type ***./gradlew basic-training-able-impl:jar***.

	1. Type ***xarchiver basic-training-able-impl/build/libs/com.liferay.basic.training.able.impl-1.0.0.jar***. Notice the new ***lib*** directory contains the JAR for Apache Commons Math..

	1. Type ***./gradlew basic-training-able-impl:deploy -Ddeploy.docker.container.id=ephesians-liferay***.

		```
		Constructing AbleBundleActivator
		Starting AbleBundleActivator
		Constructing BakerPortlet
		2021-03-23 01:48:07.910 INFO  [Refresh Thread: Equinox Container: aa880d54-e655-4715-9d9e-496fe3109448][BundleStartStopLogger:46] STARTED com.liferay.basic.training.able.impl_1.0.0 [1356]
		```

		Notice that it not only started ***com.liferay.basic.training.able.impl***, but it also reconstructed BakerPortlet? Why? Because BakerPortlet references AbleNumberGenerator.

	1. Go to http://localhost:8080. Refresh the page that contains the widget ***Basic Training Baker***. Verify the console output.

		```
		Invoking BakerPortlet#doView 61249400
		```

	1. Separating the API from the implementation allows developers to hide implementation details (i.e. The BakerPortlet class does not to know that the AbleNumberGenerator class uses Apache Commons Math).

## Apache Felix

1. Under the hood, Liferay uses Apache Felix to provide OSGi capabilities. Download [Apache Felix](https://felix.apache.org/documentation/subprojects/apache-felix-framework/apache-felix-framework-usage-documentation.html) and follow the [tutorial examples](https://felix.apache.org/documentation/tutorials-examples-and-presentations/apache-felix-osgi-tutorial.html).

## Gogo Shell inside Liferay

1. Go to http://localhost:8080. Navigate to Control Panel > System > Gogo Shell and type ***lb*** to see all bundles.

1. Read about [Gogo Shell](https://learn.liferay.com/dxp/7.x/en/liferay-internals/fundamentals/using-the-gogo-shell/gogo-shell-commands.html) and its [available commands](http://felix.apache.org/documentation/subprojects/apache-felix-gogo.html).

1. Figure out how to connect to Gogo Shell from the [command line](https://learn.liferay.com/dxp/7.x/en/liferay-internals/fundamentals/using-the-gogo-shell/command-line-gogo-shell.html). Use telnet to interact with Gogo Shell from the command line.