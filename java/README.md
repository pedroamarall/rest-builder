# Java

## Java File

1. Launch Terminator.

1. Write your Java file.

	1. Type ***mkdir my-java-project && cd my-java-project***.

	1. Type ***touch Test.java***.

	1. Type ***osub Test.java*** and paste the following code.

		```
		public class Test {

			public static void main(String[] args) {
				System.out.println("Hello, World!");
			}

		}
		```

## Compile

1. Type ***la***.

	```
	drwxrwxr-x 1 me me  18 Mar 11 12:05 .
	drwxrwxr-x 1 me me 404 Mar 11 12:05 ..
	-rw-rw-r-- 1 me me   0 Mar 11 12:05 Test.java
	```

1. Type ***javac *.java***.

1. Type ***la***.

	```
	drwxrwxr-x 1 me me  38 Mar 11 12:07 .
	drwxrwxr-x 1 me me 402 Mar 11 12:07 ..
	-rw-rw-r-- 1 me me 415 Mar 11 12:07 Test.class
	-rw-rw-r-- 1 me me 107 Mar 11 12:07 Test.java
	```

1. Notice the new Test.class file. Type ***osub Test.class***.

	```
	cafe babe 0000 0034 001d 0a00 0600 0f09
	0010 0011 0800 120a 0013 0014 0700 1507
	0016 0100 063c 696e 6974 3e01 0003 2829
	5601 0004 436f 6465 0100 0f4c 696e 654e
	756d 6265 7254 6162 6c65 0100 046d 6169
	6e01 0016 285b 4c6a 6176 612f 6c61 6e67
	2f53 7472 696e 673b 2956 0100 0a53 6f75
	7263 6546 696c 6501 0009 5465 7374 2e6a
	6176 610c 0007 0008 0700 170c 0018 0019
	0100 0d48 656c 6c6f 2c20 576f 726c 6421
	0700 1a0c 001b 001c 0100 0454 6573 7401
	0010 6a61 7661 2f6c 616e 672f 4f62 6a65
	6374 0100 106a 6176 612f 6c61 6e67 2f53
	7973 7465 6d01 0003 6f75 7401 0015 4c6a
	6176 612f 696f 2f50 7269 6e74 5374 7265
	616d 3b01 0013 6a61 7661 2f69 6f2f 5072
	696e 7453 7472 6561 6d01 0007 7072 696e
	746c 6e01 0015 284c 6a61 7661 2f6c 616e
	672f 5374 7269 6e67 3b29 5600 2100 0500
	0600 0000 0000 0200 0100 0700 0800 0100
	0900 0000 1d00 0100 0100 0000 052a b700
	01b1 0000 0001 000a 0000 0006 0001 0000
	0001 0009 000b 000c 0001 0009 0000 0025
	0002 0001 0000 0009 b200 0212 03b6 0004
	b100 0000 0100 0a00 0000 0a00 0200 0000
	0400 0800 0500 0100 0d00 0000 0200 0e
	```

	This is bytecode (a machine representation) of your Test.java file.

## Run

1. Type ***java Test***.

	```
	Hello, World!
	```

1. Modify Test.java and change ***Hello, World!*** to ***Hello, Bob!***.

1. Type ***java Test***.

	```
	Hello, World!
	```

	Why did it still print out ***Hello, World!***?

1. Type ***javac *.java***.

1. Type ***java Test***.

	```
	Hello, Bob!
	```

## Imports

## Libraries

## Packages

## Inheritance

## Overloading

## Pass by Reference vs. Pass by Value.