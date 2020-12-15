# 安装sonarqube

## 首先安装数据库
```bash
sh install_pg.sh
```

## 安装sonarquebe
```bash
sh install_sonar.sh
```

## 启动服务
```
sudo -u sonar sonarqube-8.5.1.38104/bin/linux-x86-64/sonar.sh start
```
## 注意
1. java版本要求11或者以上版本
2. 使用sonar用户启动脚本
 

