# reference: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html
#!/bin/bash

sudo apt-get update
sudo yum install docker -y
sudo yum install docker.io docker-compose -y
sudo service docker start
sudo usermod -a -G docker ec2-user