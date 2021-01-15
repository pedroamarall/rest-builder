# Web Servers

## Apache

1. Run Apache.

	1. Launch Terminator.

	1. Type ***telnet localhost 80***. This command fails because nothing is running on port 80.

	1. Go to http://localhost. Chrome cannot access this URL because nothing is running on port 80.

	1. Type ***d run --rm -it -p 80:80 httpd:2.4***

	1. Open a new Terminator tab and type ***telnet localhost 80***.

	1. Type ***<CONTROL+]>*** and then type ***quit*** to exit out of telnet on port 80.

	1. Go to http://localhost. A web page is returned that says ***It works!***.

1. Update your website.

	1. Type ***d ps*** to get the hash of your Apache server.

		```
		CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
		1ef0de855560        httpd:2.4           "httpd-foreground"       37 seconds ago      Up 36 seconds       0.0.0.0:80->80/tcp                  jovial_galois
		```

		In this case, the container ID is 1ef0de855560.

	1. Type ***d exec -it 1ef0de855560 bash*** to go into your container.

	1. Type ***ls***.

	1. Type ***la***. This command fails because this alias is only setup on your computer.

	1. Type ***cd htdocs*** to go to ***/usr/local/apache2/htdocs***.

	1. Type ***ls***.

	1. Type ***more index.html***.

		```
		<html><body><h1>It works!</h1></body></html>
		```

	1. Type ***echo "This is good!" > index.html***.

	1. Type ***more index.html***.	

		```
		This is good!
		```

	1. Type ***exit***.	

	1. Refresh Chrome on http://localhost.

	1. Type ***<Control+C>*** on the Terminator tab that started Apache.

1. Update your website without going into your Docker container.

	1. Create the directory ***/home/me/myhttp***.

	1. Go to ***/home/me/myhttp***.

	1. Type ***echo "This is really good!" > index.html***.

	1. Type ***d run --rm -it -p 80:80 -v /home/me/myhttp:/usr/local/apache2/htdocs httpd:2.4***

	1. Refresh Chrome on http://localhost.

	1. Use Sublime to edit ***/home/me/myhttp/index.html*** and add some random text.

	1. Refresh Chrome on http://localhost.

	1. Use Sublime to make the file ***/home/me/myhttp/hello.html*** and add some random text.

	1. Go to http://localhost/hello.html.

	1. Use Sublime to make the file ***/home/me/myhttp/abc/123.html*** and add some random text.

	1. Go to http://localhost/abc/123.html.

	1. Type ***<Control+C>*** on the Terminator tab that started Apache.

## Challenges

1. Repeat the above tutorial, but name your Apache Docker container and run it in the background.

1. Repeat the Apache above tutorial for Nginx.