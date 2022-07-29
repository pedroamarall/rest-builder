# Liferay

## Running Liferay from Docker

1. Type ***d run -it -p 8080:8080 liferay/portal:7.4.3.35-ga35***.

1. Go to http://localhost:8080 after Liferay has started.

1. Type ***<Control+C>*** to stop Liferay.

## Building Liferay from Source

1. Fork the Liferay public repository at https://github.com/liferay/liferay-portal.

	1. The repository is already cloned on your computer at ***/home/me/dev/projects/liferay-portal***.

	1. Update /home/me/dev/projects/liferay-portal/.git/config and change all the references from ***brianchandotcom*** to your GitHub username.

	1. Liferay also has a private repository at https://github.com/liferay/liferay-portal-ee that is also aleady cloned on your computer at ***/home/me/dev/projects/liferay-portal-ee***. That clone and its work directories at ***/home/me/dev/projects/liferay-portal-\**** will be explained later. They are not relevant for this tutorial.

1. Update your local clone of https://github.com/liferay/liferay-portal.

	1. Go to ***/home/me/dev/projects/liferay-portal***.

	1. Type ***g log*** to view the existing Git log.

	1. Type ***g pull upstream master*** to download the latest commits on the master branch from https://github.com/liferay/liferay-portal.

	1. Open a new Terminator tab and type ***g log***. Notice that the Git log will be updated if your local clone was updated.

1. Push changes from your local clone to your origin.

	1. Running ***g pull upstream master*** pulls the code on the master branch from https://github.com/liferay/liferay-portal to your local machine. You also forked https://github.com/liferay/liferay-portal at https://github.com/<YOUR_GITHUB_USERNAME>/liferay-portal.

		New code that is pushed to https://github.com/liferay/liferay-portal is not automatically pushed to https://github.com/<YOUR_GITHUB_USERNAME>/liferay-portal.

	1. Type ***g log origin/master*** to see the commits in your origin.

	1. Type ***g push origin master*** to push the commits in your local clone up to https://github.com/<YOUR_GITHUB_USERNAME>/liferay-portal.

1. Type ***more /home/me/dev/projects/liferay-portal/app.server.me.properties***. The source code is configured to deploy to ***/home/me/dev/bundles/master***.

	1. Type ***la ~/dev/bundles/master/osgi/modules***.

	1. Type ***ant clean***.

	1. Type ***la ~/dev/bundles/master/osgi/modules***. Notice that files were removed.

	1. Type ***ant all***. This command can take a while. Generally, you do not have to run this more than once a day.

	1. Type ***la ~/dev/bundles/master/osgi/modules***. Notice that files were copied there.

	1. Go to ***~/dev/bundles/master/tomcat-9.0.37/bin***.

	1. Type ***./catalina.sh run*** to start Liferay.

	1. Chrome will automatically open to http://localhost:8080 after Liferay has started.