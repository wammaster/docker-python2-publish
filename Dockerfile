FROM python

RUN apt-get update
RUN apt-get install -y ssh rsync curl wget git-all unzip python2.7 python2.7-dev locales

# Cleaning
RUN apt-get clean

# Install the application.
ADD . /usr/local/src/gdal-docker/
RUN /usr/local/src/gdal-docker/build.sh

# Externally accessible data is by default put in /data
WORKDIR /data
VOLUME ["/data"]

# Output version and capabilities by default.
CMD gdalinfo --version && gdalinfo --formats && ogrinfo --formats

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
