build & run

```
docker build -t inetlinux/mail .
docker run --rm -v /home:/home -p 25:25 -p 465:465 -p 143:143 -p 993:993 -p 110:110 -p 995:995 --name mail inetlinux/mail

docker run --rm -v /home:/home -it inetlinux/mail /bin/bash


```

verify

```
$ echo -n admin:123456|base64
YWRtaW46MTIzNDU2
$ curl -H 'Authorization: Basic YWRtaW46MTIzNDU2' -i http://localhost:8080/


```
