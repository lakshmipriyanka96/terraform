#!/bin/bash
yum update -y
yum install httpd  -y 
yum install java -y 
yum install docker git maven ansible -y
systemctl restart httpd && systemctl status httpd
systemctl restart docker && systemctl status docker

