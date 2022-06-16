#!/bin/bash -x

yum update -y  # add sudo in front for all of command below
yum install python3 -y 
pip3 install flask 
 cd /home/ec2-user 
 # go to github and your repository and project 001. copy raw link of app

FOLDER='https://raw.githubusercontent.com/wookeemin/my-repository-practice/main/Project-001-Roman-Numerals-Converter'

wget ${FOLDER}/app.py #first, copy url of the raw of app.py and later change to the /app.py  

mkdir templates && cd templates 

wget ${FOLDER}/templates/index.html 

wget ${FOLDER}/templates/result.html 

cd ..

python3 app.py 

