#!/bin/bash

# Jane's List of shortcuts

echo "
Shortcuts:
	speedtest
	root
	home
	cs
	newScala
	docs (the Second Hard Drive, documents)
"
# Depenencies: wget must be installed
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip --report-speed=bits";
alias ls="ls -FG";
alias root="cd /";
alias home="cd";
alias cs='cd /Volumes/The\ Second\ Hard\ Drive/Google\ Drive/Documents/UMass\ Classes/Spring2016/CS\ 220'
alias docs='cd /Volumes/The\ Second\ Hard\ Drive/Google\ Drive/Documents'
alias updategc='gcloud compute copy-files /Volumes/The\ Second\ Hard\ Drive/Google\ Drive/Documents/GitHubUpdates/httpServer jktangen@instance-1:~/ --zone "us-central1-f"'

function newScala {

	name=$1;
	projFolder=${2:-'./'};
	cd $projFolder;
	mkdir $name;
	cd $name;
	mkdir src;
	mkdir -p src/main/scala;
	mkdir -p src/test/scala;
	mkdir project;
	touch build.sbt project/plugins.sbt;
	echo "You are now in: ";
	pwd;
	subl src/main/scala/$name.scala src/test/scala/${name}Test.scala project/plugins.sbt build.sbt;
	read -p "Edit and save plugins.sbt and build.sbt. Press [Enter] key to start backup...\n"
	sbt;
 }
 
# this is to remember for later. 
# defaults write com.apple.finder AppleShowAllFiles YES; killall Finder

export PS1="\j \# (\W) \$"
