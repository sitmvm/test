FROM biocommons/seqrepo

MAINTAINER Liang Chen "chenl9@upmc.edu"

ADD ./fetch-seqrepo.sh /fetch-seqrepo.sh
RUN chmod a+x /fetch-seqrepo.sh

CMD /fetch-seqrepo.sh
