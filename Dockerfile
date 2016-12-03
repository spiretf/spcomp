from ioft/i386-ubuntu
maintainer Robin Appelman <robin@icewind.nl>

ADD ./install.sh /install.sh
RUN mkdir /data \
	&& apt-get update \
	&& apt-get install -y wget unzip \
	&& rm -rf /var/lib/apt/lists/*
RUN /install.sh

WORKDIR /data
ENTRYPOINT ["/scripting/spcomp"]
