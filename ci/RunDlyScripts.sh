#!/bin/bash
sudo -u www scp /var/lib/jenkins/jobs/kc_mit_6_0/workspace/kcmit-webapp/target/kcmit-webapp-6.0.0.1.war www@kc-train-web:/usr/local/tomcat-kc-train/webapps/kc-train.war
