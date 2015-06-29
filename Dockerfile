FROM    progrium/busybox
MAINTAINER Ivan Pedrazas <ipedrazas@gmail.com>

RUN opkg-install curl

ADD ./start.sh /bin/start
ENV SHELL /bin/bash

ENTRYPOINT ["/bin/start"]
CMD []
