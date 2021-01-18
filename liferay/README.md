# Liferay

## Running Liferay from Docker

1. Type ***d run -it -p 8080:8080 liferay/portal:7.3.5-ga6***.

1. Go to http://localhost:8080 after Liferay has started.

1. Type ***<Control+C>*** to stop Liferay.

## Building Liferay from Source

1. Fork the Liferay public repository at https://github.com/liferay/liferay-portal.

	1. The repository is already cloned on your computer at ***/home/me/dev/projects/liferay-portal***.

	1. Update /home/me/dev/projects/liferay-portal/.git/config and change all the references to ***brianchandotcom*** to your GitHub username.

	1. Liferay also has a private repository at https://github.com/liferay/liferay-portal-ee that is aleady cloned on your computer at ***/home/me/dev/projects/liferay-portal-ee***. That clone and its work directories at ***/home/me/dev/projects/liferay-portal-\**** will be explained later. For now, they are not relevant.

1. Type ***more /home/me/dev/projects/liferay-portal/app.server.me.properties***. The source code is configured to deploy to ***/home/me/dev/bundles/master***.

	1. Type ***la ~/dev/bundles/master/osgi/modules***.

	1. Type ***ant clean***.

	1. Type ***la ~/dev/bundles/master/osgi/modules***. Notice that files were removed.

	1. Type ***ant all***. This command can take a while. Generally, you do not have to run this more than once a day.

	1. Type ***la ~/dev/bundles/master/osgi/modules***. Notice that files were copied there.

	1. Go to ***~/dev/bundles/master/tomcat-9.0.37/bin***.

	1. Type ***./catalina.sh run*** to start Liferay.

	1. Chrome will automatically open to http://localhost:8080 after Liferay has started.