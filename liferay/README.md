# Liferay

## Running Liferay from Docker

1. Type ***d run -it -p 8080:8080 liferay/portal:7.3.5-ga6***.

1. Go to http://localhost:8080 after Liferay has started.

1. Type ***<Control+C>*** to stop Liferay.

## Building Liferay from Source

1. Go to ***/home/me/dev/projects/liferay-portal***.

1. Type ***more /home/me/dev/projects/liferay-portal/app.server.me.properties***. The source code is configured to deploy to ***/home/me/dev/bundles/master***.

1. Type ***la ~/dev/bundles/master/osgi/modules***.

1. Type ***ant clean***.

1. Type ***la ~/dev/bundles/master/osgi/modules***. Notice that files were removed.

1. Type ***ant all***.

1. Type ***la ~/dev/bundles/master/osgi/modules***. Notice that files were copied there.

1. Go to ***~/dev/bundles/master/tomcat-9.0.37/bin***.

1. Type ***./catalina.sh run*** to start Liferay.

1. Chrome will automatically open to http://localhost:8080 after Liferay has started.