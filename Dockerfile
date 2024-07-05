# Esto es un comentario
FROM registry.access.redhat.com/ubi9/ubi:9.4

LABEL description="My Apache Image" \
      io.k8s.description="My Apache Image" \
      io.openshift.expose-services="8080:tcp" \
      io.openshift.min-cpu=4 \
      io.openshift.min-memory=16Gi \
      io.openshift.tags="ubi9,rhel9,example,apache"

MAINTAINER Pablo Peralta <cellosofia1@gmail.com>

RUN dnf -y install httpd && \
    dnf clean all && \
    sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf && \
    chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd

EXPOSE 8080

ENV LogLevel="info" \
    MyEnv="anothervar" \
    Otherenv="othervalue"

ADD ./index.html /var/www/html/index.html

COPY ./info.html /var/www/html/info.html

USER 1001

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]

