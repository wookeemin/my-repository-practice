#! /bin/bash -x

yum update -y
yum install httpd -y 
chmod +r /var/www/html

FOLDER= https://raw.githubusercontent.com/wookee/my-repository/main/Project-101-kittens-carousel-static-website-ec2/static-web #paste from raw index.html in Github
wget ${FOLDER}/index.html
wget ${FOLDER}/cat0.jpg
wget ${FOLDER}/cat1.jpg
wget ${FOLDER}/cat2.jpg
wget ${FOLDER}/cat3.png

systemctl enable httpd
sytemctl start httpd

