FROM alpine as build

RUN apk --no-cache add --virtual pyfda-build-dependencies \
    build-base \
    python3-dev \
    py3-pip \
    py3-setuptools \
    py3-numpy \
    qt5-qtbase-dev \
    openblas-dev

RUN pip install --upgrade pip
RUN pip install pyfda --prefix=/opt/pyfda

