FROM alpine as build

RUN apk --no-cache add --virtual pyfda-build-dependencies \
    build-base \
    python3-dev \
    py3-pip \
    py3-wheel \
    py3-numpy \
    py3-scipy \
    qt5-qtbase-dev \
    py3-qt5 \
    openblas-dev

RUN pip install --upgrade pip
RUN pip install pyfda --prefix=/opt/pyfda

