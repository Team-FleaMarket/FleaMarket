# FleaMarket 跳蚤市场

![Image text](https://media.githubusercontent.com/media/Team-FleaMarket/FleaMarket/main/src/main/webapp/static/images/show1.png)
![Image text](https://media.githubusercontent.com/media/Team-FleaMarket/FleaMarket/main/src/main/webapp/static/images/show2.jpg)
![Image text](https://media.githubusercontent.com/media/Team-FleaMarket/FleaMarket/main/src/main/webapp/static/images/show3.jpg)
![Image text](https://media.githubusercontent.com/media/Team-FleaMarket/FleaMarket/main/src/main/webapp/static/images/show4.jpg)

## 配置与运行

#### 配置要求与配置方法：
1. JDK 17 or JDK 21 
   1. 无需添加环境变量
   2. 在 Project Structure 中的 SDKs 中添加 JDK，
2. Tomcat 10
   1. 无需添加环境变量，以便多个版本的 Tomcat 切换运行
   2. 在 IDEA 的 Settings 中的 Application Servers 添加 Tomcat
3. Maven 3
   1. 添加环境变量
   2. 设置镜像源
   3. 在 IDEA 的 Settings 中的 Maven 设置中选择 Maven home path、User settings file、Local repository
4. MySQL 8

#### 运行项目
1. 引入 pom.xml 文件中的项目依赖
2. 在 Edit Configuration 中添加 Tomcat，然后在 Deployment 中添加 Artifact，将 Application context 设为空
3. 点击运行按钮
