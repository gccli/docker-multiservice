# A guideline for running multi-service in docker container

虽然[docker](https://docs.docker.com/engine/admin/multi-service_container/)并不推荐在一个容器中启多个服务，但有些场景可能需要，比如通过docker image形式集成提供Rest Api服务的第三方产品，可能第三方产品依赖Nginx, php-fpm, mysql，传统的方式可能将Rest Api服务通过VM image的形式发布，但这并不利于集成方部署，并且比较消耗资源。本文介绍一种在一个docker容器中运行多个服务的方案。

假设我们将实现授权管理服务(LMS):

* LMS以Rest Api提供服务，web app通过php实现，使用Yii框架，依赖web server nginx和php-fpm.
* LMS部署于docker的/opt/lms目录下

## Build lsm docker image

docker可以通过[Dockerfile](https://docs.docker.com/engine/reference/builder/)中的指令来自动构建docker image, `Dockerfile`的编写应该严格遵循官方要求的[最佳实践](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)

本例的Dockerfile如下：

![Dockerfile](Dockerfile "Dockerfile")

  docker build -t "lms" .





## Start docker container

  docker run --name hsmp --privileged=true -p 11443:443 -d -t hsmp-lsm


## Verify

   # docker exec -it hsmp /bin/bash
   [root@107248d77247 /]# supervisorctl status
   nginx                            RUNNING   pid 7, uptime 0:02:54
   php-fpm                          RUNNING   pid 8, uptime 0:02:54
