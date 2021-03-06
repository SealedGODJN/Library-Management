# 注意事项
* 这是个eclipse项目, 直接导入eclipse即可使用! 目前已经包含了:
  * src文件的结构
  * 空的SSH配置文件
  * 整个项目目前所需的所有jars
* 将项目导入工作空间时注意一下运行环境的版本
  * Tomcat 8.0.48 -- 非必要, 仅做参考
  * Tomcat的运行环境: jre 1.8.0_212 -- 非必要, 仅做参考
  * 项目的运行环境: jre 1.8.0_212 -- 非必要, 仅做参考
  * 项目的编译环境: 1.8 -- 非必要, 仅做参考
  * SSH的版本号详见jars文件
  * **暂定**有三个分支(mandarin-reader, mandarin-admin, mandarin-librarian), 每个小组在各自负责的分支上新建分支(命名示例mandarin-reader-xxx) 
---
# 关于项目的简单解释，**欢迎补充和更正**!!!
  * java源码结构的解释
    * **action** -- Struts2框架下的功能实现处, 与前端代码的编写有密切的关系; 个人的理解是其与**dao**和**service**一起对应MVC设计模式中的C(Controller） 
    * **dao** -- 被**service**调用, 利用Hibernate控制持久化层(即对数据库的数据进行操作)
    * **entity** -- 用于表示ER模型中的E, 作为pojo其属性与E的字段一一对应; 对应MVC设计模式中的M(Model),
    * **service** -- 为**action**的功能实现提供服务, 并调用**dao**完成数据库的操作, 为当次功能的实施写下句点
    * **utils** -- 所有根架构无关的东西的实现, 例如查询函数的实现, 创建sessionFactory的函数的实现, 密码加密函数的实现等
  * Spring框架在此项目的作用
    * 在项目运行时控制所有java bean(经配置后的java对象)的生命周期, 具体来讲就是控制action等类的对象生成, 并将需要的依赖注入其中
