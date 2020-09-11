FROM quay.io/openshifthomeroom/workshop-dashboard:5.0.0

USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

ENV TERMINAL_TAB=split

RUN yum install docker -y

USER 1001

RUN /usr/libexec/s2i/assemble
RUN git clone https://github.com/afouladi7/quay_workshop_instructions.git