#!/bin/bash
# 基于 centos 7.8安装脚本
# 安装java环境
rpm -ivh jdk-11.0.9_linux-x64_bin.rpm

# 安装sonar
if test -e sonarqube-8.5.1.38104
then
    echo "installed"
else
    unzip sonarqube-8.5.1.38104.zip
fi
# sonarqube-8.5所属改为sonar用户
chown -R sonar:sonar sonarqube-8.5.1.38104
chown -R sonar:sonar conf

# 增加sonar用户
useradd sonar

# 创建数据库
DB_NAME=sonarqube
sudo -u postgres createuser -d -r sonar
sudo -u sonar createdb --owner sonar $DB_NAME
sudo -u postgres psql -c "ALTER USER sonar PASSWORD 'sonar'"
# echo sonor.jdbc.url=jdbc:postgresql://localhost/$DB_NAME >> sonarqube-8.5.1.38104/conf/sonar.properties

# 复制配置文件
\cp -r conf/* sonarqube-8.5.1.38104/conf/

# 启动sonar
# sudo -u sonar sonarqube-8.5.1.38104/bin/linux-x86-64/sonar.sh start
