# Databases

## MySQL

1. Start a MySQL server.

	1. Launch Terminator.

	1. Type ***d run --name galatians -d -e MYSQL_ROOT_PASSWORD=lovethepoor -p 3306:3306 mysql:8.0.22***.

	1. This runs a Docker image called ***galatians*** in the background.

	1. Type ***d logs galatians*** to see its startup logs.

	1. Type ***telnet localhost 3307***.

		```
		Trying ::1...
		telnet: connect to address ::1: Connection refused
		Trying 127.0.0.1...
		telnet: connect to address 127.0.0.1: Connection refused
		```

		This command fails because nothing is running on port 3307.

	1. Type ***telnet localhost 3306***.

		```
		Trying ::1...
		Connected to localhost.
		Escape character is '^]'.
		J
		8.0.22	Wxb;bO�C(=k~|Mcaching_sha2_password
		```

		This command works because MySQL is running on port 3306.

	1. Type ***<CONTROL+]>*** and then type ***quit*** to exit out of telnet on port 3306.

	1. Type ***d stop galatians***.

	1. Type ***telnet localhost 3306***. This command fails because MySQL is stopped.

	1. Type ***d rm galatians***.

	1. Type ***d start galatians***. This command fails because we deleted the Docker container called ***galatians***.

	1. Type ***d run --name galatians -d -e MYSQL_ROOT_PASSWORD=lovethepoor -p 3306:3306 mysql:8.0.22*** to recreate the Docker container.

	1. Type ***d exec -it galatians mysql -uroot -p*** to run the MySQL client that exists on the MySQL server. Your password is ***lovethepoor***.

		The command is split into two parts. The first part, ***d exec -it galatians***, tells Docker to execute a command on the ***galatians*** container. The second part, ***mysql -uroot -p***, is the command that is run on the container itself.

		The argument ***-uroot*** signifies the root user for MySQL and not the root user for the computer. That is why the password is ***lovethepoor*** and not the password you used to login to your computer.

	1. Type ***show databases;***. This lists the databases available in MySQL.

		```
		+--------------------+
		| Database           |
		+--------------------+
		| information_schema |
		| mysql              |
		| performance_schema |
		| sys                |
		+--------------------+
		```

	1. Type ***use mysql;***.

	1. Type ***show tables;***. This lists the tables in the ***mysql*** database. Note that the MySQL server happens to have a database within it called ***mysql***. This is the ***mysql*** database and not the the ***mysql*** client referenced in ***d exec -it galatians mysql -uroot -p***.

	1. Type ***use information_schema;***.

	1. Type ***show tables;***.

	1. Type ***quit*** to exit the container.

	1. Type ***d stop galatians*** and  ***d start galatians*** to restart the container. This step is not necessary but is written here so you know how to restart a container based on its name.

1. Connect to a MySQL server with a MySQL client over the network.

	1. Get your IP.

	1. Type ***d run --rm -it mysql:8.0.22 mysql -h192.168.xxx.xxx -uroot -p***. Replace ***192.168.xxx.xxx*** with your IP.

	1. Type ***quit*** to exit the container.

## SQL

1. Connect to MySQL.

	1. Launch Terminator.

	1. Type ***d exec -it galatians mysql -uroot -p***.

1. Create a database.

	1. Type ***create database mydata;***.

	1. Type ***show databases;***.

		```
		+--------------------+
		| Database           |
		+--------------------+
		| information_schema |
		| mydata             |
		| mysql              |
		| performance_schema |
		| sys                |
		+--------------------+
		```

	1. Type ***use mydata;*** to go into your newly created database;

	1. Type ***show tables;*** to see that there are no tables;

1. Create a table.

	1. Type ***create table Book (bookId bigint primary key, authorId bigint, description varchar(75), name varchar(75));*** to create your first table.

	1. Type ***desc Book;*** to describe your table;

		```
		+-------------+-------------+------+-----+---------+-------+
		| Field       | Type        | Null | Key | Default | Extra |
		+-------------+-------------+------+-----+---------+-------+
		| bookId      | bigint      | NO   | PRI | NULL    |       |
		| authorId    | bigint      | YES  |     | NULL    |       |
		| description | varchar(75) | YES  |     | NULL    |       |
		| name        | varchar(75) | YES  |     | NULL    |       |
		+-------------+-------------+------+-----+---------+-------+
		```

	1. Type ***show tables;***

		```
		+------------------+
		| Tables_in_mydata |
		+------------------+
		| Book             |
		+------------------+
		```

1. Drop a table.

	1. Type ***drop table Book;***

	1. Type ***show tables;***

	1. Type ***create table Book (bookId bigint primary key, authorId bigint, description varchar(75), name varchar(75));*** to recreate the Book table.

1. Insert into a table.

	1. Type ***create table Author (authorId bigint primary key, description varchar(75), name varchar(75));***.

	1. Type ***show tables;***

	1. Type ***desc Author;***

	1. Type ***insert into Author values (1, "Paul was the least of the apostles.", "Paul");***

1. Select from a table.

	1. Type ***select * from Author;***

		```
		+----------+-------------------------------------+------+
		| authorId | description                         | name |
		+----------+-------------------------------------+------+
		|        1 | Paul was the least of the apostles. | Paul |
		+----------+-------------------------------------+------+
		```

	1. Type ***insert into Author values (2, "John was the beloved disciple.", "John");***

	1. Type ***select * from Author;***

		```
		+----------+-------------------------------------+------+
		| authorId | description                         | name |
		+----------+-------------------------------------+------+
		|        1 | Paul was the least of the apostles. | Paul |
		|        2 | John was the beloved disciple.      | John |
		+----------+-------------------------------------+------+
		```

	1. Type ***insert into Author values (2, "Peter betrayed Jesus three times.", "Peter");***

		```
		ERROR 1062 (23000): Duplicate entry '2' for key 'Author.PRIMARY'
		```

		This command fails because John was already assigned ***2*** as the primary key. The primary key is unique per row in the table.

	1. Type ***insert into Author values (3, "Peter betrayed Jesus three times.", "Peter");***

	1. Type ***insert into Author values (4, "Judas was in charge of the moneybag.", "Judas");***

	1. Type ***select * from Author;***.

		```
		+----------+--------------------------------------+-------+
		| authorId | description                          | name  |
		+----------+--------------------------------------+-------+
		|        1 | Paul was the least of the apostles.  | Paul  |
		|        2 | John was the beloved disciple.       | John  |
		|        3 | Peter betrayed Jesus three times.    | Peter |
		|        4 | Judas was in charge of the moneybag. | Judas |
		+----------+--------------------------------------+-------+
		```
	1. Type ***select * from Author where authorId = 4;***.

		```
		+----------+--------------------------------------+-------+
		| authorId | description                          | name  |
		+----------+--------------------------------------+-------+
		|        4 | Judas was in charge of the moneybag. | Judas |
		+----------+--------------------------------------+-------+
		```

	1. Type ***select * from Author where name = "John";***.

		```
		+----------+--------------------------------+------+
		| authorId | description                    | name |
		+----------+--------------------------------+------+
		|        2 | John was the beloved disciple. | John |
		+----------+--------------------------------+------+
		```

	1. Type ***select * from Author where description like "%was%";***.

		```
		+----------+--------------------------------------+-------+
		| authorId | description                          | name  |
		+----------+--------------------------------------+-------+
		|        1 | Paul was the least of the apostles.  | Paul  |
		|        2 | John was the beloved disciple.       | John  |
		|        4 | Judas was in charge of the moneybag. | Judas |
		+----------+--------------------------------------+-------+
		```

	1. Type ***select * from Author where name like "%a%";***.

		```
		+----------+--------------------------------------+-------+
		| authorId | description                          | name  |
		+----------+--------------------------------------+-------+
		|        1 | Paul was the least of the apostles.  | Paul  |
		|        4 | Judas was in charge of the moneybag. | Judas |
		+----------+--------------------------------------+-------+
		```

	1. Type ***select * from Author order by name;***

		```
		+----------+-----------------------------------------------------------+----------+
		| authorId | description                                               | name     |
		+----------+-----------------------------------------------------------+----------+
		|        2 | John was the beloved disciple.                            | John     |
		|        4 | Matthias was chosen by lot to replace Judas in Acts 1:26. | Matthias |
		|        1 | Paul was the least of the apostles.                       | Paul     |
		|        3 | Peter betrayed Jesus three times.                         | Peter    |
		+----------+-----------------------------------------------------------+----------+
		```

	1. Type ***select * from Author order by name desc;***

		```
		+----------+-----------------------------------------------------------+----------+
		| authorId | description                                               | name     |
		+----------+-----------------------------------------------------------+----------+
		|        3 | Peter betrayed Jesus three times.                         | Peter    |
		|        1 | Paul was the least of the apostles.                       | Paul     |
		|        4 | Matthias was chosen by lot to replace Judas in Acts 1:26. | Matthias |
		|        2 | John was the beloved disciple.                            | John     |
		+----------+-----------------------------------------------------------+----------+
		```

	1. Type ***select * from Author order by name asc;***

		```
		+----------+-----------------------------------------------------------+----------+
		| authorId | description                                               | name     |
		+----------+-----------------------------------------------------------+----------+
		|        2 | John was the beloved disciple.                            | John     |
		|        4 | Matthias was chosen by lot to replace Judas in Acts 1:26. | Matthias |
		|        1 | Paul was the least of the apostles.                       | Paul     |
		|        3 | Peter betrayed Jesus three times.                         | Peter    |
		+----------+-----------------------------------------------------------+----------+
		```

	1. Type ***select name from Author;***

		```
		+----------+
		| name     |
		+----------+
		| Paul     |
		| John     |
		| Peter    |
		| Matthias |
		+----------+
		```

	1. Type ***select authorId, name from Author;***

		```
		+----------+----------+
		| authorId | name     |
		+----------+----------+
		|        1 | Paul     |
		|        2 | John     |
		|        3 | Peter    |
		|        4 | Matthias |
		+----------+----------+
		```

	1. Type ***select count(\*) from Author;***

		```
		+----------+
		| count(*) |
		+----------+
		|        4 |
		+----------+
		```

1. Delete from a table.

	1. Type ***select * from Author;***.

		```
		+----------+--------------------------------------+-------+
		| authorId | description                          | name  |
		+----------+--------------------------------------+-------+
		|        1 | Paul was the least of the apostles.  | Paul  |
		|        2 | John was the beloved disciple.       | John  |
		|        3 | Peter betrayed Jesus three times.    | Peter |
		|        4 | Judas was in charge of the moneybag. | Judas |
		+----------+--------------------------------------+-------+
		```

	1. Type ***delete from Author where name = "Judas";***.

		```
		+----------+-------------------------------------+-------+
		| authorId | description                         | name  |
		+----------+-------------------------------------+-------+
		|        1 | Paul was the least of the apostles. | Paul  |
		|        2 | John was the beloved disciple.      | John  |
		|        3 | Peter betrayed Jesus three times.   | Peter |
		+----------+-------------------------------------+-------+
		```

1. Update from a table.

	1. Type ***insert into Author values (4, "Judas was in charge of the moneybag.", "Judas");***

	1. Type ***select * from Author;***.

		```
		+----------+--------------------------------------+-------+
		| authorId | description                          | name  |
		+----------+--------------------------------------+-------+
		|        1 | Paul was the least of the apostles.  | Paul  |
		|        2 | John was the beloved disciple.       | John  |
		|        3 | Peter betrayed Jesus three times.    | Peter |
		|        4 | Judas was in charge of the moneybag. | Judas |
		+----------+--------------------------------------+-------+
		```

	1. Type ***update Author set description = "Matthias was chosen by lot to replace Judas in Acts 1:26.", name = "Matthias" where authorId = 4;***

	1. Type ***select * from Author;***.

		```
		+----------+-----------------------------------------------------------+----------+
		| authorId | description                                               | name     |
		+----------+-----------------------------------------------------------+----------+
		|        1 | Paul was the least of the apostles.                       | Paul     |
		|        2 | John was the beloved disciple.                            | John     |
		|        3 | Peter betrayed Jesus three times.                         | Peter    |
		|        4 | Matthias was chosen by lot to replace Judas in Acts 1:26. | Matthias |
		+----------+-----------------------------------------------------------+----------+
		```

1. Join tables.

	1. Type ***insert into Book values (1, 1, "This is the first letter to the church in Thessalonica.", "1 Thessalonians");***

	1. Type ***select * from Book;***

		```
		+--------+----------+---------------------------------------------------------+-----------------+
		| bookId | authorId | description                                             | name            |
		+--------+----------+---------------------------------------------------------+-----------------+
		|      1 |        1 | This is the first letter to the church in Thessalonica. | 1 Thessalonians |
		+--------+----------+---------------------------------------------------------+-----------------+
		```

	1. Type ***insert into Book values (2, 1, "This is the second letter to the church in Thessalonica.", "2 Thessalonians");***

	1. Type ***insert into Book values (3, 1, "This is the letter to the church in Galatia.", "Galatians");***

	1. Type ***insert into Book values (4, 1, "This is the letter to the church in Ephesus.", "Ephesians");***

	1. Type ***insert into Book values (5, 1, "This is the letter to the church in Philippi.", "Philippians");***

	1. Type ***insert into Book values (6, 1, "This is the letter to the church in Colossus.", "Colossians");***

	1. Type ***insert into Book values (7, 2, "This is the the Gospel of John.", "John");***

	1. Type ***insert into Book values (8, 2, "This book was written by John when he was exiled on the island of Patmos.", "Revelation");***

	1. Type ***select * from Book;***

		```
		+--------+----------+---------------------------------------------------------------------------+-----------------+
		| bookId | authorId | description                                                               | name            |
		+--------+----------+---------------------------------------------------------------------------+-----------------+
		|      1 |        1 | This is the first letter to the church in Thessalonica.                   | 1 Thessalonians |
		|      2 |        1 | This is the second letter to the church in Thessalonica.                  | 2 Thessalonians |
		|      3 |        1 | This is the letter to the church in Galatia.                              | Galatians       |
		|      4 |        1 | This is the letter to the church in Ephesus.                              | Ephesians       |
		|      5 |        1 | This is the letter to the church in Philippi.                             | Philippians     |
		|      6 |        1 | This is the letter to the church in Colossus.                             | Colossians      |
		|      7 |        2 | This is the the Gospel of John.                                           | John            |
		|      8 |        2 | This book was written by John when he was exiled on the island of Patmos. | Revelation      |
		+--------+----------+---------------------------------------------------------------------------+-----------------+
		```

	1. Type ***select Author.name from Author inner join Book on Book.authorId = Author.authorId where Book.name = "Revelation";***

		```
		+------+
		| name |
		+------+
		| John |
		+------+

	1. Type ***select Author.name from Author inner join Book on Book.authorId = Author.authorId where Book.description like "%letter%";***

		```
		+------+
		| name |
		+------+
		| Paul |
		| Paul |
		| Paul |
		| Paul |
		| Paul |
		| Paul |
		+------+
		```

	1. Type ***select distinct Author.name from Author inner join Book on Book.authorId = Author.authorId where Book.description like "%letter%";***

		```
		+------+
		| name |
		+------+
		| Paul |
		+------+
		```

	1. Type ***select distinct Author.name from Author inner join Book on Book.authorId = Author.authorId where Book.description like "%letter%";***

## Challenges

1. Write a SQL statement that returns the name of all the authors and the number of books they wrote.

	<details> 
		<summary>Show answer.</summary>

		select Author.name from Author inner join Book on Author.authorId = Book.authorId group by Author.authorId having count(Book.authorId) > 1;
	</details>

1. Write a SQL statement that returns the name of all the authors who wrote more than one book.

	<details> 
		<summary>Show answer.</summary>

		select Author.name, count(Book.authorId) from Author inner join Book on Author.authorId = Book.authorId group by Author.authorId;
	</details>

1. Explain why the command ***d run --rm -it mysql:8.0.22 mysql -h127.0.0.1 -uroot -p*** does not work.

	1. Type ***sudo dnf install mysql*** to install the MySQL client on your local machine.

	1. Type ***mysql -h127.0.0.1 -uroot -p***. This command works. Why does this work? As a clue, type ***d ps*** to list all the running Docker containers.

1. Repeat the MySQL tutorial but for PostgreSQL and send the instructor your tutorial.