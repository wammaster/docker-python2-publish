FROM python

RUN apt-get update
RUN apt-get install -y ssh rsync curl wget git-all unzip python2.7 python2.7-dev

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Cleaning
RUN apt-get clean
