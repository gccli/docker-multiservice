FROM centos

RUN yum -y install epel-release && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum -y install php56w php56w-fpm php56w-cli php56w-common php56w-gd php56w-pdo php56w-mbstring php56w-xml nginx supervisor

COPY lsm /opt/lsm
COPY supervisord.d/nginx.ini /etc/supervisord.d/
COPY supervisord.d/php-fpm.ini /etc/supervisord.d/

RUN chown -R nobody /opt/lsm/application/web

EXPOSE 443

CMD ["/usr/bin/supervisord", "-n"]

