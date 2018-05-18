
build & run

```
docker build -t sample .
docker run --rm -v $PWD/app.py:/app.py --name sample -p 8080:8080 sample

```

verify

```
$ echo -n admin:123456|base64
YWRtaW46MTIzNDU2
$ curl -H 'Authorization: Basic YWRtaW46MTIzNDU2' -i http://localhost:8080/
```
