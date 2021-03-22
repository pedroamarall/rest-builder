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

1. Type ***javac \*.java***.

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

1. Modify Test.java and remove a semicolon.

	```
	System.out.println("Hello, World!");
	```

	The above block should look like the following.

	```
	System.out.println("Hello, World!")
	```

1. Type ***javac \*.java***.

	```
	Test.java:4: error: ';' expected
			System.out.println("Hello, World!")
			                                   ^
	1 error
	```

1. Readd your semicolon and type ***javac \*.java***.

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

1. Type ***javac \*.java***.

1. Type ***java Test***.

	```
	Hello, Bob!
	```

1. The program ***javac*** is used to compile Java files and the program ***java*** is used to run the compiled Java classes.

## Imports

1. Modify Test.java.

	```
	System.out.println("Hello, Bob!");
	```

	The above block should look like the following.

	```
	Random random = new Random();

	System.out.println("Hello, " + random.nextInt() + "!");
	```

1. Type ***javac \*.java***.

	```
	Test.java:4: error: cannot find symbol
			Random random = new Random();
			^
	  symbol:   class Random
	  location: class Test
	Test.java:4: error: cannot find symbol
			Random random = new Random();
			                    ^
	  symbol:   class Random
	  location: class Test
	2 errors
	```

	Test.java failed to compile because it does not know what ***Random*** means.

1. Import the class [java.util.Random](https://docs.oracle.com/javase/8/docs/api/java/util/Random.html) by adding following line to the very top of Test.java.

	```
	import java.util.Random;
	```

1. Type ***javac \*.java***.

1. Type ***java Test***.

	```
	Hello, 665207864!
	```

1. Run it many times. Notice that the output is different every time because the program is printing a random integer.

1. Classes belong to packages. The ***Random*** class belongs to the package [java.util](https://docs.oracle.com/javase/8/docs/api/java/util/package-summary.html). Check out the default [packages](https://docs.oracle.com/javase/8/docs/api/overview-summary.html) that come with Java 8.

1. Check out the package [java.lang](https://docs.oracle.com/javase/8/docs/api/java/lang/package-summary.html). The package ***java.lang*** contains many classes. These classes are avaiable by default and do not need to be imported.

1. Use ***java.lang.StrictMath***.

	```
	System.out.println("Hello, " + random.nextInt() + "!");
	```

	The above block should look like the following.

	```
	System.out.println("Hello, " + StrictMath.PI + "!");
	```

1. Type ***javac \*.java && java Test***.

	```
	Hello, 3.141592653589793!
	```

	The field [PI](https://docs.oracle.com/javase/8/docs/api/java/lang/StrictMath.html#PI) is part of the class [StrictMath](https://docs.oracle.com/javase/8/docs/api/java/lang/StrictMath.html). Notice that you did not need to import the StrictMath class because the classes in the package ***java.lang*** are available by default.

1. Use ***java.util.Date***.

	```
	System.out.println("Hello, " + StrictMath.PI + "!");
	```

	The above block should look like the following.

	```
	System.out.println("Hello, " + new Date() + "!");
	```

1. Type ***javac \*.java && java Test***. Why did this command fail? Fix it and try it again.

1. The syntax ***new Date()*** creates a new instance of the class Date.

	```
	Hello, Sun Mar 21 21:46:24 BRT 2021!
	```

## Libraries

1. Type ***osub Test.java*** and paste the following code.

	```
	import org.apache.commons.math3.util.ArithmeticUtils;

	public class Test {

		public static void main(String[] args) {
			System.out.println(
				"1 + 2 is equal to " + ArithmeticUtils.addAndCheck(1, 2) + ".");
		}

	}
	```

1. Type ***javac \*.java***.

	```
	Test.java:1: error: package org.apache.commons.math3.util does not exist
	import org.apache.commons.math3.util.ArithmeticUtils;
	                                    ^
	Test.java:7: error: cannot find symbol
				"1 + 2 is equal to " + ArithmeticUtils.addAndCheck(1, 2) + ".");
				                       ^
	  symbol:   variable ArithmeticUtils
	  location: class Test
	2 errors
	```

	This failed to compile because ***org.apache.commons.math3.util*** is a third party package. This package is available inside a Java library called ***commons-math3-3.6.1.jar***.

1. Type ***wget https://repo1.maven.org/maven2/org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar*** to download commons-math3-3.6.1.jar.

1. Type ***la***.

	```
	drwxrwxr-x 1 brian brian      84 Mar 21 21:54 .
	drwxrwxr-x 1 brian brian     402 Mar 18 15:16 ..
	-rw-rw-r-- 1 brian brian 2213560 Mar 17  2016 commons-math3-3.6.1.jar
	-rw-rw-r-- 1 brian brian     672 Mar 21 21:46 Test.class
	-rw-rw-r-- 1 brian brian     169 Mar 21 21:51 Test.java
	```

1. Type ***javac \*.java***.

	```
	Test.java:1: error: package org.apache.commons.math3.util does not exist
	import org.apache.commons.math3.util.ArithmeticUtils;
	                                    ^
	Test.java:7: error: cannot find symbol
				"1 + 2 is equal to " + ArithmeticUtils.addAndCheck(1, 2) + ".");
				                       ^
	  symbol:   variable ArithmeticUtils
	  location: class Test
	2 errors
	```

	The JAR ***commons-math3-3.6.1.jar*** is in the same directory as Test.java, but the Java compiler was not told to use it.

1. Type ***javac -classpath commons-math3-3.6.1.jar \*.java***. This time, it compiled.

1. Type ***la***. Notice that the date of Test.class was modified.

	```
	drwxrwxr-x 1 brian brian      84 Mar 21 21:59 .
	drwxrwxr-x 1 brian brian     402 Mar 21 21:59 ..
	-rw-rw-r-- 1 brian brian 2213560 Mar 17  2016 commons-math3-3.6.1.jar
	-rw-rw-r-- 1 brian brian     712 Mar 21 22:08 Test.class
	-rw-rw-r-- 1 brian brian     199 Mar 21 22:00 Test.java
	```

1. Type ***java Test***.

	```
	Exception in thread "main" java.lang.NoClassDefFoundError: org/apache/commons/math3/util/ArithmeticUtils
		at Test.main(Test.java:6)
	Caused by: java.lang.ClassNotFoundException: org.apache.commons.math3.util.ArithmeticUtils
		at java.net.URLClassLoader.findClass(URLClassLoader.java:382)
		at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
		at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:349)
		at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
		... 1 more
	```

	The program failed to execute because we ran the Test class without giving information about where to find the library that contains the class ***org.apache.commons.math3.util.ArithmeticUtils***.

1. Type ***java -classpath commons-math3-3.6.1.jar Test***.

	```
	Error: Could not find or load main class Test
	```

	The program could not find the Test class.

1. Type ***java -classpath .:commons-math3-3.6.1.jar Test***.

	```
	1 + 2 is equal to 3.
	```

	This command worked because you included the current directory ***.*** and ***commons-math3-3.6.1.jar***. Both of those entries were separated by a colon. You can add many directories and libraries separated by colons.

## Packages

1. Delete commons-math3-3.6.1.jar, Test.class, and Test.java.

1. Type ***osub Test.java*** and paste the following code.

	```
	public class Test {

		public static void main(String[] args) {
			System.out.println("Hello, World!");
		}

	}
	```

1. Type ***mkdir -p com/acme/able && mkdir -p com/acme/baker && mkdir -p com/acme/charlie***.

1. Type ***osub com/acme/able/Test.java*** and paste the following code.

	```
	package com.acme.able;

	public class Test {

		public static void main(String[] args) {
			System.out.println("Hello, Able!");
		}

	}
	```

1. Type ***osub com/acme/baker/Test.java*** and paste the following code.

	```
	package com.acme.baker;

	public class Test {

		public static void main(String[] args) {
			System.out.println("Hello, Baker!");
		}

	}
	```

1. Type ***osub com/acme/charlie/Test.java*** and paste the following code.

	```
	package com.acme.charlie;

	public class Test {

		public static void main(String[] args) {
			System.out.println("Hello, Charlie!");
		}

	}
	```

1. Type ***la com/acme/able***.

	```
	drwxrwxr-x 1 brian brian  18 Mar 21 22:34 .
	drwxrwxr-x 1 brian brian  32 Mar 21 22:30 ..
	-rw-r--r-- 1 brian brian 130 Mar 21 22:34 Test.java
	```

1. Type ***javac \*.java***.

1. Type ***la com/acme/able***.

	```
	drwxrwxr-x 1 brian brian  18 Mar 21 22:34 .
	drwxrwxr-x 1 brian brian  32 Mar 21 22:30 ..
	-rw-r--r-- 1 brian brian 130 Mar 21 22:34 Test.java
	```

1. Type ***javac com/acme/able/\*.java***.

1. Type ***la com/acme/able***.

	```
	drwxrwxr-x 1 brian brian  38 Mar 21 22:37 .
	drwxrwxr-x 1 brian brian  32 Mar 21 22:30 ..
	-rw-rw-r-- 1 brian brian 428 Mar 21 22:37 Test.class
	-rw-r--r-- 1 brian brian 130 Mar 21 22:34 Test.java
	```

1. Type ***java com.acme.able.Test***.

	```
	Hello, Able!
	```

1. Type ***java Test***.

	```
	Hello, World!
	```

1. Compile and run ***com.acme.baker.Test*** and ***com.acme.charlie.Test***. You should now see the relationship between packages and directories.

## Inheritance

1. Type ***osub Fruit.java*** and paste the following code.

	```
	public abstract class Fruit {

		public abstract String getColor();

		public boolean isSweet() {
			return true;
		}

	}
	```

1. Type ***osub Apple.java*** and paste the following code.

	```
	public class Apple extends Fruit {

		public String getColor() {
			return "red";
		}

	}
	```

1. Type ***osub Lemon.java*** and paste the following code.

	```
	public class Lemon extends Fruit {

		public String getColor() {
			return "yellow";
		}

	}
	```

1. Type ***osub Test.java*** and paste the following code.

	```
	public class Test {

		public static void main(String[] args) {
			Fruit fruit1 = new Apple();

			System.out.println("Fruit 1 has " + fruit1.getColor() + " color.");

			if (fruit1.isSweet()) {
				System.out.println("Fruit 1 is sweet.");
			}
			else {
				System.out.println("Fruit 1 is not sweet.");				
			}

			Fruit fruit2 = new Lemon();

			System.out.println("Fruit 2 has " + fruit2.getColor() + " color.");

			if (fruit2.isSweet()) {
				System.out.println("Fruit 2 is sweet.");
			}
			else {
				System.out.println("Fruit 2 is not sweet.");				
			}
		}

	}
	```

1. Type ***javac \*.java***. Classes in the same directory (and the same package) do not need to import each other.

1. Type ***java Test***.

	```
	Fruit 1 has red color.
	Fruit 1 is sweet.
	Fruit 2 has yellow color.
	Fruit 2 is sweet.
	```

1. Lemons are generally not sweet. Let's [override](https://en.wikipedia.org/wiki/Method_overriding) the ***isSweet*** method. Type ***osub Lemon.java*** and paste the following code.

	```
	public class Lemon extends Fruit {

		public String getColor() {
			return "yellow";
		}

		public boolean isSweet() {
			return false;
		}

	}
	```

1. Type ***javac \*.java && java Test***.

	```
	Fruit 1 has red color.
	Fruit 1 is sweet.
	Fruit 2 has yellow color.
	Fruit 2 is not sweet.
	```

1. Lemons are not always yellow. Let's [overload](https://en.wikipedia.org/wiki/Function_overloading) the ***getColor*** method. Type ***osub Lemon.java*** and paste the following code.

	```
	public class Lemon extends Fruit {

		public String getColor() {
			return "yellow";
		}

		public String getColor(boolean ripe) {
			if (ripe) {
				return getColor();
			}

			return "brown";
		}

		public boolean isSweet() {
			return false;
		}

	}
	```

1. Type ***osub Test.java*** and paste the following code.

	```
	public class Test {

		public static void main(String[] args) {
			Lemon lemon = new Lemon();

			System.out.println("Ripe lemons are " + lemon.getColor(true) + ".");
			System.out.println("Decayed lemons are " + lemon.getColor(false) + ".");
		}

	}
	```

1. Type ***javac \*.java && java Test***.

	```
	Ripe lemons are yellow.
	Decayed lemons are brown.
	```

## More Information

1. Follow the tutorial in https://www.w3schools.com/java/default.asp. Run the examples locally on your machine (and not just on your browser) to familiarize yourself with compiling and running.

## Pass by Reference or Pass by Value?

1. Type ***osub Test.java*** and paste the following code.

	```
	public class Test {

		public static void main(String[] args) {
			int value = 10;

			update(value);
			
			System.out.println(value);
		} 

		public static void update(int value) {
			value = 15;
		}

	}
	```

1. Type ***javac \*.java && java Test***. Why did it print out 10 instead of 15?

1. Type ***osub Test.java*** and paste the following code.

	```
	import java.util.concurrent.atomic.AtomicInteger;

	public class Test {

		public static void main(String[] args) {
			AtomicInteger value = new AtomicInteger(10);

			update(value);
			
			System.out.println(value);
		} 

		public static void update(AtomicInteger value) {
			value.set(15);
		}

	}
	```

1. Type ***javac \*.java && java Test***. Why did it print out 15 instead of 10?

1. Type ***osub Test.java*** and paste the following code.

	```
	public class Test {

		public static void main(String[] args) {
			int[] value = {10};

			update(value);
			
			System.out.println(value[0]);
		} 

		public static void update(int[] value) {
			value[0] = 15;
		}

	}
	```

1. Type ***javac \*.java && java Test***. Why did it print out 15 instead of 10?

1. Read this [post](https://stackoverflow.com/questions/40480/is-java-pass-by-reference-or-pass-by-value) for more information.

## Gradle