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
# 	if [ $1=='-h' ]; then     # this part is in the works, one day it will be ready
# 		echo "This command will make a new homework folder for CS220, in the appropriate place. 
# Please enter in 'newHW (name of file) ' ";
# 	else
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
# 	fi;
 }
function addTimes {
	filename=~/internetTimes.csv
	echo "start" > $filename
	i=0
	#total seconds in a day:
	#j=86400
	j=10

	refresh=1
	
	while [ $i -lt $j ]  
	do 
	i=$[$i+$refresh]
	echo $(ping -c 1 google.com | grep -o "time=\d\+.\d\{3\} ms" | grep -o "\d\+.\d\{3\}" ) "ms," $(date +%a) ", " >> $filename
	sleep $refresh
	done
}
# this is to remember for later.
# defaults write com.apple.finder AppleShowAllFiles YES
export PS1="\j \# (\W) \$"
