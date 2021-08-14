FROM quay.io/redhatgov/workshop-dashboard:latest

USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src && \
    mkdir /run/containers && \
    chgrp -R 0 /run/containers && \
    chown -R 1001 /run/containers && \
    chmod 777 /run/containers && \
    yum install skopeo -y

ENV TERMINAL_TAB=split

USER 1001

RUN /usr/libexec/s2i/assemble
