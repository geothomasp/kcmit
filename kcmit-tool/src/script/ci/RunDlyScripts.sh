#!/bin/bash
env=$ENV
if [ "$env" == "kcdev" -o "$env" == "all" ] 
then
	sudo -u www cp -u /var/lib/jenkins/jobs/kc_mit/workspace/target/kc_mit-5.2.1.1.war /usr/local/tomcat_kc_dev/webapps/kc-dev.war
	sleep 1
	#sudo -u www chown www:www /usr/local/tomcat_kc_dev/webapps/kc-dev.war
	#sleep 1
fi
if [ "$env" == "kcqa" -o "$env" == "all" ]
then
	sudo -u www scp /var/lib/jenkins/jobs/kc_mit/workspace/target/kc_mit-5.2.1.1.war www@kc-qa-web:/usr/local/tomcat_kc_qa/webapps/kc-qa.war
	sleep 1
	sudo -u coeus cp -u /var/lib/jenkins/jobs/kc_mit/workspace/target/kc_mit-5.2.1.1.war /home/coeus/kc/deployment/.
	sleep 1
fi
