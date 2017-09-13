###
# Based on cernphsft/systemuser:v2.9
# Implements the extra-save for Notebooks on the host
#
# Please, build with `docker build -t cernphsft/systemuser:v2.9b -f extra_save.Dockerfile .`
###

FROM cernphsft/systemuser:v2.9
MAINTAINER Enrico Bocchi

EXPOSE 8888

RUN mv /usr/local/lib/python3.5/site-packages/notebook/services/contents/fileio.py /usr/local/lib/python3.5/site-packages/notebook/services/contents/fileio.py.save
ADD extra_save.d/fileio.py /usr/local/lib/python3.5/site-packages/notebook/services/contents/fileio.py
ADD extra_save.d/systemuser.sh /srv/singleuser/systemuser.sh

CMD ["sh", "/srv/singleuser/systemuser.sh"]
