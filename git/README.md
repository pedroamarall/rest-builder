# Git

## Command Line Git

1. Run Git.

	1. Launch Terminator.

	1. Type ***git --version***.

		1. Type ***g --version***.

		1. Why do the commands ***git*** and ***g*** do the same thing?

1. Configure Git.

	1. Open ***~/.gitconfig***.

	1. The existing settings are optimal for a Linux environment.

	1. Modify the settings in the ***[user]*** block to your email address and name.

		```
		[user]
			email = brian.chan@liferay.com
			name = Brian Chan
		```

	1. Configure a GitHub personal access token.

		1. Open a new tab in Terminator and type ***gi***. Notice that GitHub asked you for a password. Close that tab.

		1. Login to GitHub. Go to ***Settings***. Go to ***Developer settings***. Go to ***Personal access tokens***.

		1. Generate a new token.

		1. Call it ***Liferay GitHub Pull Request Command Line***. The exact name is not important.

		1. Check every checkbox in ***repo*** and ***workflow***. The other checkboxes do not need to be checked.

		1. Copy the the OAuth token (e.g. 8293900a17fe51514830f3e457d7ef67415f93ca) and replace 123456789 in the ***[github]*** block.

			```
			[github]
				oauth-token = 123456789
				user = brianchandotcom
			```

		1. Open a new tab in Terminator and type ***gi***. Notice that GitHub did not ask you for a password.

## Repositories

1. Go to ***/home/me/dev/projects***. List the contents of that directory.

	```
	drwxrwxr-x  1 me me 1988 Jan  5 09:02 com-liferay-osb-asah-private
	drwxrwxr-x  1 me me 1196 Jan  4 13:50 com-liferay-osb-faro-private
	drwxr-xr-x  1 me me  220 Dec 30 15:36 git-tools
	drwxrwxr-x. 1 me me  468 Jan  7 11:53 liferay-basic-training
	drwxrwxr-x  1 me me  470 Dec  5 16:39 liferay-learn
	drwxrwxr-x  1 me me 3296 Jan  6 15:46 liferay-portal
	drwxrwxr-x  1 me me 3382 Jan  4 15:49 liferay-portal-7.0.x
	drwxrwxr-x  1 me me  192 Jan  4 15:50 liferay-portal-7.0.x-private
	drwxrwxr-x  1 me me 3450 Jan  4 15:50 liferay-portal-7.1.x
	drwxrwxr-x  1 me me  192 Jan  4 15:50 liferay-portal-7.1.x-private
	drwxrwxr-x  1 me me 3102 Jan  4 15:51 liferay-portal-7.2.x
	drwxrwxr-x  1 me me  192 Jan  4 15:51 liferay-portal-7.2.x-private
	drwxr-xr-x  1 me me 2978 Jan  5 10:32 liferay-portal-7.3.x
	drwxrwxr-x  1 me me  192 Jan  4 15:51 liferay-portal-7.3.x-private
	drwxr-xr-x  1 me me 3058 Jan  5 08:16 liferay-portal-ee
	drwxr-xr-x  1 me me  192 Jan  5 10:32 liferay-portal-master-private
	```

1. Put your sample repositories in this directory.

## SmartGit

## Pull Requests

1. Configure GitHub SSH key.

	1. Login to GitHub. Go to ***Settings***. Go to ***SSH and GPG keys***.

	1. Configure a new SSH key. The title can be anything you want it to be. The key should contain the public value in ***~/id_rsa.pub*** and not the private value in ***~/id_rsa***.