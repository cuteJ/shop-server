# 管理系统
该项目为【管理系统】后端部分

>项目执行maven报错请查看：[issues/2](https://github.com/cuteJ/shop-server/issues/2)

分支说明

**1.x.x** 该分支提供基础模版  
**2.x.x** 计划添加业务功能（如：订单，商品等） 

前端项目地址：[shop-web-mgt](https://github.com/cuteJ/shop-web-mgt)

## 项目介绍
`shop-server`是【管理系统】后端项目，基于Spring boot实现。
 
 **项目说明**
 
   该项目致力于为开发者提供一套快速系统搭建模版，（包含：系统用户，菜单，权限，调度任务，常量，数据字典等功能）
 以便开发人员专注于业务功能开发。

### 项目教程

* [开发安装使用](https://juejin.im/post/5ebfae146fb9a043491e6e66)


### 项目演示
 <a href="http://shop-web-mgt.onlythinking.com" target="_blank">**在线地址**</a>

## 文档相关
* [Swagger](https://www.zzhjshop.com/shop_test/swagger-ui.html)
* [Docs Of Html (Html格式文档)](https://cutej.github.io/shop-server/index.html)
* [Docs Of Pdf（Pdf格式文档）](http://shop-mgt.zzhjshop.com/pdf/index.pdf)

### 项目结构

为了方便合并和拆分项目，分两个模块：

   * shop-server-app c端api服务模块（简化描述叫 app）
   * shop-server-mgt 主要为`shop-web-mgt`提供接口 （简化描述叫 mgt）

```
shop-server
    ├── install -- 脚本文件
    ├── shop-server-api -- 公共模块（包含 model mapper 工具配置类等）
    ├── shop-server-app （包含 H5登录，各类小程序登录） 
    ├── shop-server-mgt 
```

## 快速开始

``` bash
 git clone https://github.com/cuteJ/shop-server.git
 cd shop-server
 mvn clean install
```

#### 打包发版

```
 git clone https://github.com/cuteJ/shop-server.git
 cd shop-server
 mvn clean install

 # 编辑该文件 MS_HOME 目录 和需要自定义的变量
 shop-server
     ├── install
         ├── shell
             ├── execute.sh
 ./execute.sh start
```
#### 启动变量
**数据库配置**

变量名|默认值|说明
---|:--:|---:
MYSQL_URL|127.0.0.1:3306|数据库地址
MYSQL_DATABASE|cuteJ_shop|数据库
MYSQL_USER|cuteJ_shop|用户名
MYSQL_PASSWORD|cuteJ_shop123|密码

**服务配置**

变量名|默认值|说明
---|:--:|---:
SERVER_PORT|8300|服务端口
SERVER_CONTEXT_PATH|/shop|上下文
SERVER_SESSION_TIMEOUT|1800|管理后台Session超时时间（单位秒）
APP_CORS_ORIGIN|http://localhost:9527|跨越配置（多个地址时，逗号分割）

**Jwt**

变量名|默认值|说明
---|:--:|---:
JWT_HEADER|Authorization|请求头
JWT_SECRET|abkfdsfooi0934| 密钥
JWT_EXPIRATION|86400|失效时间（单位秒）

**OSS存储**

变量名|默认值|说明
---|:--:|---:
APP_OSS_KEY|无|ossKey
APP_OSS_SECRET|无|secret
APP_OSS_ENDPOINT|无|上传地址
APP_OSS_URL|无|访问地址
APP_OSS_BUCKET|无|bucket

## 开发计划
 * 1.x 计划版本(1.0.0) 待测试
 * 2.x 待开发 

## 致谢
 * [**Wechat-Group**](https://github.com/Wechat-Group/WxJava)
 
## 许可证

[MIT License](https://github.com/cuteJ/shop-server/blob/master/LICENSE)

Copyright © 2020 icutej.com. All rights reserved.
