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

		1. Check every checkbox in ***repo*** and ***workflow***. The other checkboxes do not need to be checked. Generate token.

		1. Copy the the OAuth token (e.g. 8293900a17fe51514830f3e457d7ef67415f93ca) and replace 123456789 in the ***[github]*** block. Uncomment that line by removing #.

			```
			[github]
				#oauth-token = 123456789
				user = brianchandotcom
			```

			The above block should look like the following.

			```
			[github]
				oauth-token = 8293900a17fe51514830f3e457d7ef67415f93ca
				user = brianchandotcom
			```

		1. Change the user property value to your GitHub username (e.g. joebloggs).

			```
			[github]
				oauth-token = 8293900a17fe51514830f3e457d7ef67415f93ca
				user = joebloggs
			```

		1. Open a new tab in Terminator and type ***gi***. Notice that GitHub did not ask you for a password.

		1. Try and figure out which program is executed when you type ***gi***.

	1. Configure a GitHub SSH key.

		1. Login to GitHub. Go to ***Settings***. Go to ***SSH and GPG keys***.

		1. Configure a new SSH key. The title can be anything you want it to be. The key should contain the public value in ***~/id_rsa.pub*** and not the private value in ***~/id_rsa***.

		1. TODO: Write an example showing when an SSH key is required.

## Git Repositories

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

1. The directory ***/home/me/dev/projects/liferay-learn*** is a Git repository because it contains the directory ***.git***.

	1. Go to ***/home/me/dev/projects/liferay-learn***.

	1. Verify that the directory ***.git*** exists.

	1. Type ***git status***.

		```
		On branch master
		Your branch is up to date with 'origin/master'.

		nothing to commit, working tree clean
		```
	1. Type ***g st*** to get the same result. The alias for ***git*** to ***g*** is set in ***~/.bashrc***. The alias for ***status*** to ***st*** is set in ***~/.gitconfig***.

		```
		[alias]
			...
			st = status
		```

	1. Go up one directory to ***/home/me/dev/projects***.

	1. Type ***g st***. Why does the command fail?

1. Create a repository.

	1. Create a directory called ***/home/me/dev/projects/my-first-repo***.

	1. Go to ***/home/me/dev/projects/my-first-repo***.

	1. Type ***g st***. This command fails because this directory is not a Git repository.

	1. Type ***g init*** to turn this directory into a Git repository.

	1. Type ***g st***.

		```
		On branch master

		No commits yet

		nothing to commit (create/copy files and use "git add" to track)
		```

	1. Type ***g log***.

		```
		fatal: your current branch 'master' does not have any commits yet
		```

		This is the expected error message because there are no commits in the repository.

1. Make changes to a repository.

	1. Go to your newly created repository in ***/home/me/dev/projects/my-first-repo***.

	1. Type ***echo "Aaaaaaaaaa" > abc.txt***.

	1. Type ***g st***.

		```
		On branch master

		No commits yet

		Untracked files:
		  (use "git add <file>..." to include in what will be committed)
			abc.txt

		nothing added to commit but untracked files present (use "git add" to track)
		```

	1. Type ***echo "Dddddddddd" > def.txt***.

	1. Type ***g st***.

		```
		On branch master

		No commits yet

		Untracked files:
		  (use "git add <file>..." to include in what will be committed)
			abc.txt
			def.txt

		nothing added to commit but untracked files present (use "git add" to track)
		```

	1. Type ***g add def.txt***.

	1. Type ***g st***.

		```
		On branch master

		No commits yet

		Changes to be committed:
		  (use "git rm --cached <file>..." to unstage)
			new file:   def.txt

		Untracked files:
		  (use "git add <file>..." to include in what will be committed)
			abc.txt

		```

	1. Type ***g log***.

		```
		fatal: your current branch 'master' does not have any commits yet
		```

		This is still the expected error message because there are no commits to the repository.

	1. Type ***g ci -m "This is my first commit." -a*** to make your first commit. Only the file def.txt was added as part of that commit.

	1. Type ***g log***.

		```
		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374 (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:27:13 2021 -0300

		    This is my first commit.
		```

		Every commit has a different random hash that looks like dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374.

	1. Type ***g show dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374***. Note that your hash will not be the same hash as as in this tutorial. Replace it with your hash.

		```
		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374 (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.

		diff --git a/def.txt b/def.txt
		new file mode 100644
		index 0000000..b10e4c6
		--- /dev/null
		+++ b/def.txt
		@@ -0,0 +1 @@
		+Dddddddddd
		```

		This diff shows that only def.txt was added as part of that commit.

	1. Type ***g add abc.txt***.

	1. Type ***g st***.

		```
		On branch master
		Changes to be committed:
		  (use "git restore --staged <file>..." to unstage)
			new file:   abc.txt
		```

	1. Type ***g ci -m "This is my second commit." -a*** to make your second commit. Only the file abc.txt was added as part of that commit.

	1. Type ***g st***.

		```
		$ g st
		On branch master
		nothing to commit, working tree clean
		```

	1. Type ***g log***.

		```
		commit 8085da297e1d57911552edcfd29780648b9dae6d (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***g show 8085da297e1d57911552edcfd29780648b9dae6d*** to show the contents of the second commit.

1. Working with branches.

	1. Go to your newly created repository in ***/home/me/dev/projects/my-first-repo***.

	1. Notice that your Bash prompt will look something like ***me@nuc10-i7-k6d9 ~/dev/projects/my-first-repo (master)***.

	1. Type ***g br*** to list all branches. There is only one branch and its name is master.

	1. Type ***g br 1st-branch*** to create your first branch.

	1. Type ***g br***.

	1. Type ***g br 2nd-branch*** to create your second branch.

	1. Type ***g br***.

	1. Type ***g co 1st-branch*** to go from your master branch to your first branch.

	1. Notice that your Bash prompt will look something like ***me@nuc10-i7-k6d9 ~/dev/projects/my-first-repo (1st-branch)***. You can quickly tell from your Bash prompt which Git branch you are on.

	1. Type ***echo "Gggggggggg" > ghi.txt***.

	1. Type ***g add ghi.txt***.

	1. Type ***g ci -m "This is a commit to add file ghi.txt." -a***.

	1. Type ***g log***.

		```
		commit 069f08dd8f1c07e5e4b79477b09358c179d5f675 (HEAD -> 1st-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 16:03:31 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d (master, 2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Notice that your first branch has three commits.

	1. Type ***la*** and see that you have three files.

		```
		drwxrwxr-x 1 brian brian  144 Jan 11 16:03 .git
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 abc.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 16:03 ghi.txt
		```

	1. Type ***g co master*** to go to your master branch.

	1. Type ***la*** and see that you only have two files.

		```
		drwxrwxr-x 1 brian brian   36 Jan 11 16:05 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  144 Jan 11 16:05 .git
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 abc.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		```

	1. Type ***g log*** and see that you only have two commits.

		```
		commit 8085da297e1d57911552edcfd29780648b9dae6d (HEAD -> master, 2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***g log 1st-branch***. You can get the commit log for the first branch while on the master branch.

		```
		commit 069f08dd8f1c07e5e4b79477b09358c179d5f675 (1st-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 16:03:31 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d (HEAD -> master, 2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***g cp 069f08dd8f1c07e5e4b79477b09358c179d5f675*** to cherry pick the commit from the first branch into master.

		```
		[master ad7fc9e] This is a commit to add file ghi.txt.
		 Date: Mon Jan 11 16:03:31 2021 -0300
		 1 file changed, 1 insertion(+)
		 create mode 100644 ghi.txt
		 ```

	1. Type ***la***. Notice that you now have all three files.

		```
		drwxrwxr-x 1 brian brian   50 Jan 11 16:07 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  144 Jan 11 16:07 .git
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 abc.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 16:07 ghi.txt
		```

	1. Type ***g log***.

		```
		commit ad7fc9eebb0e81df639622f847c15b9dca840ca3 (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 16:03:31 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d (2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

		Notice that the hash for the commit to add the ghi.txt file in master is ad7fc9eebb0e81df639622f847c15b9dca840ca3 but in the first branch it is 069f08dd8f1c07e5e4b79477b09358c179d5f675. Although the contents for the two branches are identical, the hashes are still different. That is because cherry pick made a copy of the commit. Technically, the two branches have now diverged and are different even though they contain the same content.

		For example, think of identical twins. They look the same (have the same content), but they have different government issued IDs (hashes) because they are different people. A government ID identifies a unique person in the same way a hash identifies a unique commit.

	1. Type ***g show ad7fc9eebb0e81df639622f847c15b9dca840ca3***.

	1. Type ***g show ad7fc9e***. This is a short version of the longer hash. I got the shorter hash from the message a few steps above when we committed the file.

		```
		[master ad7fc9e] This is a commit to add file ghi.txt.
		 Date: Mon Jan 11 16:03:31 2021 -0300
		 1 file changed, 1 insertion(+)
		 create mode 100644 ghi.txt
		 ```

	1. Type ***g co 2nd-branch***.

	1. Type ***la***.

	1. Type ***g log***.

		```
		commit 8085da297e1d57911552edcfd29780648b9dae6d (HEAD -> 2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***g merge master***.

		```
		Updating 8085da2..ad7fc9e
		Fast-forward
		 ghi.txt | 1 +
		 1 file changed, 1 insertion(+)
		 create mode 100644 ghi.txt
		```

	1. Type ***g log***.

		```
		commit ad7fc9eebb0e81df639622f847c15b9dca840ca3 (HEAD -> 2nd-branch, master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 16:03:31 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

		Notice that the hash for the commit to add the ghi.txt file in the second branch is ad7fc9eebb0e81df639622f847c15b9dca840ca3 which is idenitcal to master. In this case, the two branches have the same content and the exact same hash. They are not just twins. They are the same person.

	1. Type ***g br 3rd-branch dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374*** to make the third branch off of the hash dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374.

	1. Type ***g co 3rd-branch***.

	1. Type ***g log***.

		```
		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374 (HEAD -> 3rd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

		Notice that it only has the first commit.

	1. Type ***la***.

		```
		drwxrwxr-x 1 brian brian   22 Jan 12 08:12 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  162 Jan 12 08:12 .git
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		```

	1. Type ***echo "Jjjjjjjjjj" > jkl.txt***.

	1. Type ***g add jkl.txt***.

	1. Type ***g ci -m "This is a commit to add file jkl.txt." -a***.

	1. Type ***la***.

		```
		drwxrwxr-x 1 brian brian   36 Jan 12 08:13 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  162 Jan 12 08:13 .git
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:13 jkl.txt
		```

	1. Type ***g merge master***. You are taken to a Vi screen to enter a description. Notice how this behavior is different from when you typed ***g merge master*** earlier.

		```
		Merge branch 'master' into 3rd-branch
		# Please enter a commit message to explain why this merge is necessary,
		# especially if it merges an updated upstream into a topic branch.
		#
		# Lines starting with '#' will be ignored, and an empty message aborts
		# the commit.
		```

		Type ***:wq*** to use the default message ***Merge branch 'master' into 3rd-branch***. You can also edit that text if you want to, but it will require more Vi ninja skills.

		```
		Merge made by the 'recursive' strategy.
		 abc.txt | 1 +
		 ghi.txt | 1 +
		 2 files changed, 2 insertions(+)
		 create mode 100644 abc.txt
		 create mode 100644 ghi.txt
		```

	1. Type ***la***.

		```
		drwxrwxr-x 1 brian brian   64 Jan 12 08:14 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  162 Jan 12 08:15 .git
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:14 abc.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:14 ghi.txt
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:13 jkl.txt
		```

		Notice that it has all the files from before. Git did its best to merge the two branches. At Liferay, we consider merge commits an anti-pattern and generally avoid using it. How can we avoid this?

	1. Type ***g co master***.

	1. Type ***g log***.

		```
		commit ad7fc9eebb0e81df639622f847c15b9dca840ca3 (HEAD -> master, 2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:04:39 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***la***.

		```
		drwxrwxr-x 1 brian brian   50 Jan 12 08:20 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  162 Jan 12 08:21 .git
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:20 abc.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:20 ghi.txt

		```

	1. Type ***g log 3rd-branch***.

		```
		commit 2f1ac22b6ecac3c6132cfbe4c66c26fcf5440246 (3rd-branch)
		Merge: 515ec5d ad7fc9e
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:14:14 2021 -0300

		    Merge branch 'master' into 3rd-branch

		commit 515ec5d44665d2e6939136bb0c9c91c376fb3275
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:13:51 2021 -0300

		    This is a commit to add file jkl.txt.

		commit ad7fc9eebb0e81df639622f847c15b9dca840ca3 (HEAD -> master, 2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:04:39 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***g cp 515ec5d44665d2e6939136bb0c9c91c376fb3275*** to cherry pick just the changes from that one commit.

		```
		[master efb0715] This is a commit to add file jkl.txt.
		 Date: Tue Jan 12 08:13:51 2021 -0300
		 1 file changed, 1 insertion(+)
		 create mode 100644 jkl.txt
		 ```

	1. Type ***g log***.

		```
		commit efb071540b34fffe1f2ad3e45c2e8c8d52c543a1 (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:13:51 2021 -0300

		    This is a commit to add file jkl.txt.

		commit ad7fc9eebb0e81df639622f847c15b9dca840ca3 (2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:04:39 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***la***.

		```
		drwxrwxr-x 1 brian brian   64 Jan 12 08:22 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  162 Jan 12 08:22 .git
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:20 abc.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:20 ghi.txt
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:22 jkl.txt
		```

		Notice that all four files are there.

1. Rewriting history.

	1. Go to ***/home/me/dev/projects/my-first-repo***.

	1. Type ***g log***.

		```
		commit efb071540b34fffe1f2ad3e45c2e8c8d52c543a1 (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:13:51 2021 -0300

		    This is a commit to add file jkl.txt.

		commit ad7fc9eebb0e81df639622f847c15b9dca840ca3 (2nd-branch)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:04:39 2021 -0300

		    This is a commit to add file ghi.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***g rb -i HEAD~1*** to rebase up to one commit.

		```
		pick efb0715 This is a commit to add file jkl.txt.

		# Rebase ad7fc9e..efb0715 onto ad7fc9e (1 command)
		```

		Type ***:q!*** to exit without doing anything.

	1. Type ***g rb -i HEAD~2*** to rebase up to two commits.

		```
		pick ad7fc9e This is a commit to add file ghi.txt.
		pick efb0715 This is a commit to add file jkl.txt.

		# Rebase 8085da2..efb0715 onto 8085da2 (2 commands)
		```

		Type ***:q!*** to exit without doing anything.

	1. Type ***g rb -i HEAD~3*** to rebase up to three commits.

		```
		pick 8085da2 This is my second commit.
		pick ad7fc9e This is a commit to add file ghi.txt.
		pick efb0715 This is a commit to add file jkl.txt.
		```

		Type ***:q!*** to exit without doing anything.

	1. Type ***g rb -i HEAD~4*** to rebase up to four commits.

		```
		fatal: invalid upstream 'HEAD~4'
		```

		This command fails because you only have four commits.

	1. Type ***g rb -i HEAD~3***. Using Vi, remove the line with the hash ad7fc9e.

		```
		pick 8085da2 This is my second commit.
		pick ad7fc9e This is a commit to add file ghi.txt.
		pick efb0715 This is a commit to add file jkl.txt.
		```

		The above should look like the following.

		```
		pick 8085da2 This is my second commit.
		pick efb0715 This is a commit to add file jkl.txt.
		```

		Type ***:wq*** to save your changes.

	1. Type ***g log***.

		```
		commit 7c7c7f4bb51f8747e422ec6b51b94cad048336b0 (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:13:51 2021 -0300

		    This is a commit to add file jkl.txt.

		commit 8085da297e1d57911552edcfd29780648b9dae6d
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

		Notice that you only have three commits now and that the hash to last commit changed from efb071540b34fffe1f2ad3e45c2e8c8d52c543a1 to 7c7c7f4bb51f8747e422ec6b51b94cad048336b0.

	1. Type ***la***.

		```
		drwxrwxr-x 1 brian brian   50 Jan 12 08:32 .
		drwxrwxr-x 1 brian brian 2358 Jan 11 15:54 ..
		drwxrwxr-x 1 brian brian  162 Jan 12 08:32 .git
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:20 abc.txt
		-rw-rw-r-- 1 brian brian   11 Jan 11 15:33 def.txt
		-rw-rw-r-- 1 brian brian   11 Jan 12 08:30 jkl.txt
		```

		The file ghi.txt is no longer there because that commit was removed. You just rewrote history and so the file was never added.

	1. Type ***g reset --hard efb071540b34fffe1f2ad3e45c2e8c8d52c543a1***.

	1. Type ***g log***.

	1. Type ***la***.

	1. Type ***g reset --hard 7c7c7f4bb51f8747e422ec6b51b94cad048336b0***.

	1. Type ***g log***.

	1. Type ***la***.

	1. Type ***g reset --hard efb071540b34fffe1f2ad3e45c2e8c8d52c543a1***.

	1. Type ***g rb -i HEAD~3***. Using Vi, change ***pick ad7fc9e*** to ***e ad7fc9e***.

		```
		pick 8085da2 This is my second commit.
		pick ad7fc9e This is a commit to add file ghi.txt.
		pick efb0715 This is a commit to add file jkl.txt.
		```

		The above should look like the following.

		```
		pick 8085da2 This is my second commit.
		e ad7fc9e This is a commit to add file ghi.txt.
		pick efb0715 This is a commit to add file jkl.txt.
		```

		Type ***:wq*** to save your changes.

		```
		Stopped at ad7fc9e...  This is a commit to add file ghi.txt.
		You can amend the commit now, with

		  git commit --amend 

		Once you are satisfied with your changes, run

		  git rebase --continue
		```

	1. Type ***g ci --amend*** to change the commit message.

		```
		This is a commit to add file ghi.txt.
		```

		The above should look like the following.

		```
		This is a commit to add file ghi.txt. Hello!
		```

		Type ***:wq*** to save your changes.

	1. Type ***g rb --continue*** to finish the rebase.

	1. Type ***g log***.

		```
		commit 87ff95b54b5c3e70ef1f6e4cc8296f8a2db0573d (HEAD -> master)
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:13:51 2021 -0300

		    This is a commit to add file jkl.txt.

		commit 1a70fa3ec59f919cbfb8592f36692e65649ac28c
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Tue Jan 12 08:04:39 2021 -0300

		    This is a commit to add file ghi.txt. Hello!

		commit 8085da297e1d57911552edcfd29780648b9dae6d
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:43:13 2021 -0300

		    This is my second commit.

		commit dbd40402b41ef3dd4f5f7469dd6ac03a0ff9a374
		Author: Brian Chan <brian.chan@liferay.com>
		Date:   Mon Jan 11 15:34:16 2021 -0300

		    This is my first commit.
		```

	1. Type ***g reset --hard 7c7c7f4bb51f8747e422ec6b51b94cad048336b0***.

	1. Type ***g log***.

	1. Type ***g reset --hard efb071540b34fffe1f2ad3e45c2e8c8d52c543a1***.

	1. Type ***g log***.

	1. Type ***g reset --hard 87ff95b54b5c3e70ef1f6e4cc8296f8a2db0573d***.

	1. Type ***g log***.

	1. Type ***g reset --hard efb071540b34fffe1f2ad3e45c2e8c8d52c543a1***.

1. Clone a repository.

	1. Go to https://github.com/liferay/clay. Fork this repository to your username. For example, a fork for brianchandotcom would be at https://github.com/brianchandotcom/clay.

	1. Go to https://github.com/brianchandotcom/clay. Replace brianchandotcom with your username for the rest of this tutorial.

	1. Launch Terminator and go to ***/home/me/dev/projects***.

	1. Type ***g clone git@github.com:brianchandotcom/clay.git*** to clone the Clay repository to your local machine.

	1. There are three copies of the Clay repository that concern you. The first copy is located at https://github.com/liferay/clay and we will call that ***upstream*** for short. The second copy is located at ***https://github.com/brianchandotcom/clay*** and we will call that ***origin*** for short. The third copy is located on your computer at ***/home/me/dev/projects/clay***.

	1. Type ***osub /home/me/dev/projects/clay/.git/config***.

		```
		[core]
			repositoryformatversion = 0
			filemode = true
			bare = false
		[remote "origin"]
			url = git@github.com:brianchandotcom/clay.git
			fetch = +refs/heads/*:refs/remotes/origin/*
		[branch "master"]
			remote = origin
			merge = refs/heads/master
		```

		Change the above to look like the following. Replace brianchandotcom with your username.

		```
		[branch "master"]
			merge = refs/heads/master
			remote = origin
		[remote "origin"]
			fetch = +refs/heads/*:refs/remotes/origin/*
			url = git@github.com:brianchandotcom/clay.git
		[remote "upstream"]
			fetch = +refs/heads/*:refs/remotes/upstream/*
			url = git@github.com:liferay/clay.git
		```

1. Working with pull requests.

	1. Go to ***/home/me/dev/projects/clay***.

	1. Create a new branch called clay-1234 where 1234 are four random numbers (e.g. clay-7893 or clay-8934). Any four numbers you make up will do.

	1. Checkout that branch.

	1. Add some files. Commit those files.

	1. Your neighbor also has a fork of Clay at https://github.com/<YOUR_NEIGHBORS_GITHUB_USER_NAME>/clay and a copy of the repository on his computer.

	1. Type **gpr submit -u <YOUR_NEIGHBORS_GITHUB_USER_NAME>*** to send him your changes. Ask your neighbor to also send you a pull request.

	1. Type ***gpr***. You will see a list of open pull requests that you have for your fork of the Clay repository.

	1. Type ***gi*** to see the total number of open requests that you have across all your forks.

	1. Type ***gpr 1*** to checkout the branch that contains the contents of pull request 1 (assuming the ID is 1).

## SmartGit

1. Launch SmartGit.

1. Add the Clay repository.

1. Go to Window and use the ***Show Log Window***. If the Window menu says ***Show Working Tree Window*** then you are already in the Log Window. If not, switch to the Log Window because it is faster.

1. Use SmartGit to changes in commits.