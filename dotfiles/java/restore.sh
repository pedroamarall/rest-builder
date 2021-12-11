#!/bin/bash

source ../_common.sh

function install_ant {
	ANT_VERSION=1.9.16

	echo "Installing Ant ${ANT_VERSION}."

	sudo rm -f /opt/java/ant
	sudo rm -fr /opt/java/apache-ant-*

	download https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.zip

	sudo unzip -q data/apache-ant-${ANT_VERSION}-bin.zip -d /opt/java

	#rm data/apache-ant-${ANT_VERSION}-bin.zip

	sudo ln -fs /opt/java/apache-ant-${ANT_VERSION} /opt/java/ant
}

function install_java {
	echo "Installing JDK ${3}."

	sudo rm -f /opt/java/jdk
	sudo rm -fr /opt/java/jdk${3}*

	download https://files.liferay.com/mirrors/download.oracle.com/otn-pub/java/jdk/${1}-${2}/jdk-${1}-linux-x64.tar.gz

	sudo tar fxz data/jdk-${1}-linux-x64.tar.gz -C /opt/java

	#rm data/jdk-${1}-linux-x64.tar.gz

	sudo ln -fs /opt/java/jdk${3} /opt/java/jdk
	sudo ln -fs /opt/java/jdk${3} /opt/java/jdk${4}
}

function install_maven {
	MAVEN_VERSION=3.8.4

	echo "Installing Maven ${MAVEN_VERSION}."

	sudo rm -fr /opt/java/apache-maven-*
	sudo rm -f /opt/java/maven

	download https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip

	sudo unzip -q data/apache-maven-${MAVEN_VERSION}-bin.zip -d /opt/java

	#rm data/apache-maven-${MAVEN_VERSION}-bin.zip

	sudo ln -fs /opt/java/apache-maven-${MAVEN_VERSION} /opt/java/maven
}

install_ant
install_java 7u80 b15 1.7.0_80 7
install_java 8u221 b11 1.8.0_221 8
install_maven