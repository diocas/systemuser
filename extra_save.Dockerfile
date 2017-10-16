###
# Based on cernphsft/systemuser:v2.10
# Implements the extra-save for Notebooks on the host
#
# Please, build with `docker build -t cernphsft/systemuser:v2.10b -f extra_save.Dockerfile .`
###

FROM cernphsft/systemuser:v2.10
MAINTAINER Enrico Bocchi

EXPOSE 8888

RUN mv /usr/local/lib/python3.6/site-packages/notebook/services/contents/fileio.py /usr/local/lib/python3.6/site-packages/notebook/services/contents/fileio.py.save
ADD extra_save.d/fileio.py /usr/local/lib/python3.6/site-packages/notebook/services/contents/fileio.py

ENV SHELL /bin/bash

ADD extra_save.d/systemuser.sh /srv/singleuser/systemuser.sh
WORKDIR /root
CMD ["sh", "/srv/singleuser/systemuser.sh"]
