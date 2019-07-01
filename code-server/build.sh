#!/bin/bash

filename=code-server1.1156-vsc1.33.1-linux-x64.tar.gz

if [ ! -f $filename ]; then
    echo "Download filename to current directory"
    exit
fi

version=$(echo $filename | sed 's/code-server//;s/-linux-x64.tar.gz//')

cat >Dockerfile <<EOF
FROM ubuntu

COPY entrypoint.sh code-server${version}-linux-x64.tar.gz /
RUN apt-get update && apt-get -y install openssl && cd /usr/bin && \
    tar --strip-components=1 -xzvf /code-server${version}-linux-x64.tar.gz code-server${version}-linux-x64/code-server && \
    rm -f /code-server${version}-linux-x64.tar.gz

VOLUME [ "/home/code" ]
EXPOSE 9000
WORKDIR /home/code
ENTRYPOINT ["/entrypoint.sh"]

CMD ["code-server", "-p", "9000", "-NH" ]
EOF

docker rmi -f code-server:$version 2>/dev/null || /bin/true
docker build -t code-server:$version .
