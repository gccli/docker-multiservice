FROM centos

ARG PACKAGE_URL=https://repo.mysql.com/yum/mysql-5.7-community/docker/x86_64/mysql-community-server-minimal-5.7.22-1.el7.x86_64.rpm
ARG PACKAGE_URL_SHELL=
#https://repo.mysql.com/yum/mysql-tools-community/el/7/x86_64/mysql-shell-1.0.11-1.el7.x86_64.rpm
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes
ENV MYSQL_USER=demo
ENV MYSQL_PASSWORD=9swCHjebrx


COPY app.py requirements.txt entrypoint.sh /
RUN rpmkeys --import https://repo.mysql.com/RPM-GPG-KEY-mysql \
    && yum install -y $PACKAGE_URL $PACKAGE_URL_SHELL libpwquality epel-release \
    && yum install -y python-pip \
    && pip install -r /requirements.txt && rm -f /requirements.txt \
    && yum clean all \
    && mkdir /docker-entrypoint-initdb.d

COPY sample.sql /docker-entrypoint-initdb.d/


VOLUME /var/lib/mysql
EXPOSE 8080/tcp
ENTRYPOINT ["/entrypoint.sh"]
