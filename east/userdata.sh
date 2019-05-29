#!/bin/bash
sudo yum update -y 
sudo yum install java-1.8.0-openjdk -y
sudo alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
aws s3 ls 
aws s3 ls s3://petclinic-123 --recursive
aws s3 ls s3://petclinic-123 --recursive |sort |tail -n 1
aws s3 ls s3://petclinic-123 --recursive |sort |tail -n 1 |awk '{print $4}'
KEY=`aws s3 ls s3://petclinic-123 --recursive |sort |tail -n 1 |awk '{print $4}'`
echo $KEY
aws s3 cp s3://petclinic-123/$KEY .
ls -al 
java -jar $KEY
