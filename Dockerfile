FROM python

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
		tcl \
		tk \
		wget \
		ca-certificates \
		build-essential \
		checkinstall \
		libssl-dev \
		libgdbm-dev \
		libc6-dev \
		libbz2-dev \
		ssh \
		rsync \
		wget \
		unzip \
		git-all \
		gdal-bin \
	&& rm -rf /var/lib/apt/lists/*
