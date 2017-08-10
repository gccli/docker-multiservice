# 在一个docker container中启多个服务

虽然[docker](https://docs.docker.com/engine/admin/multi-service_container/)并不推荐在一个容器中启多个服务，但有些场景可能需要，比如通过docker image形式集成提供Rest Api服务的第三方产品，可能第三方产品依赖Nginx, php-fpm, mysql，传统的方式可能将Rest Api服务通过VM image的形式发布，但这并不利于集成方部署，并且比较消耗资源。本文介绍一种在一个docker容器中运行多个服务的方案.

假设

* docker container以Rest Api提供license管理服务(lms)，web应用通过php实现，使用Yii框架，web server采用nginx.
* lsm部署于docker的/opt/lms目录下


## Build lsm docker image

  docker build -t "lms" .







## Start docker container

  docker run --name hsmp --privileged=true -p 11443:443 -d -t hsmp-lsm


## Verify

   # docker exec -it hsmp /bin/bash
   [root@107248d77247 /]# supervisorctl status
   nginx                            RUNNING   pid 7, uptime 0:02:54
   php-fpm                          RUNNING   pid 8, uptime 0:02:54

