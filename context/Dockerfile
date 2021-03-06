# phlax/beatbox
#
# VERSION       0.0.1

ARG BUILD_FROM=phlax/golang

# Root stage
FROM $BUILD_FROM

MAINTAINER Ryan Northey <ryan@synca.io>

ENV GOPATH=/var/lib/beatbox

RUN APT_INSTALL="apt install -y -qq --no-install-recommends" \
        && apt update \
        && $APT_INSTALL software-properties-common gpg gpg-agent wget \
        && wget -qO - https://download.docker.com/linux/debian/gpg | apt-key add - \
	&& apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" \
        && apt update \
        && apt dist-upgrade -y -qq \
	&& $APT_INSTALL \
        	build-essential \
                docker-ce \
                docker-compose \
	        git \
	        libpcap0.8-dev \
	        python3-venv \
	&& mkdir -p $GOPATH/src/github.com/elastic

ARG BEATS_BRANCH=master
ENV BEATS_BRANCH=$BEATS_BRANCH \
    PATH="${PATH}:${GOPATH}/bin"

RUN cd $GOPATH/src/github.com/elastic \
	&& git clone https://github.com/elastic/beats \
	&& cd beats \
	&& git checkout $BEATS_BRANCH \
	&& make mage \
	&& echo $PATH \
	&& echo ls $GOPATH/bin \
	&& export PATH=$PATH:$GOPATH/bin \
	&& make update \
	&& go clean \
        && mage -clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
        && apt-get clean

COPY ./bin /usr/local/bin
WORKDIR $GOPATH/src/github.com/elastic/beats
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
