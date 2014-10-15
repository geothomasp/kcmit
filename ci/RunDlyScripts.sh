#!/bin/bash
env=$ENV
rundbflag=$RunDB
if [ "$env" == "kcdev" -o "$env" == "all" ] 
then
	sudo -u www cp -u /var/lib/jenkins/jobs/kc_mit_6_0/workspace/kcmit-webapp/target/kcmit-webapp-6.0.0.1.war /usr/local/tomcat_kc_dev/webapps/kc-dev.war
	sleep 3
	#sudo -u www chown www:www /usr/local/tomcat_kc_dev/webapps/kc-dev.war
	#sleep 1
fi
if [ "$env" == "kcqawkly" -o "$env" == "all" ]
then
	sudo -u www scp /var/lib/jenkins/jobs/kc_mit_6_0/workspace/kcmit-webapp/target/kcmit-webapp-6.0.0.1.war www@kc-train-web:/usr/local/tomcat-kc-qa-wkly/webapps/kc-qa-wkly.war
	sleep 3
	#sudo -u coeus cp -u /var/lib/jenkins/jobs/kc_mit_6_0/workspace/kcmit-webapp/target/kcmit-webapp-6.0.0.1.war www@kc-train-web:/home/coeus/kc/deployment/.
	#sleep 1
fi
if [ "$rundbflag" == "true" ]
then
	./RunSqlScripts.sh
fi 