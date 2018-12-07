FROM centos

ENV MYDOMAIN=example.com

RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && python /tmp/get-pip.py && yum install -y install postfix dovecot && pip install supervisor && rm -rf /etc/supervisord.conf /tmp/get-pip.py /var/cache/yum /root/.cache/pip

ADD /entrypoint.sh /
ADD supervisor /etc/supervisor

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/var/mail", "/home"]
EXPOSE 25 110 143 587 993 995

CMD [ "/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf" ]