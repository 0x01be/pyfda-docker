FROM alpine as build

RUN apk --no-cache add --virtual pyfda-build-dependencies \
    git \
    build-base \
    qt5-qtbase-dev \
    python3-dev \
    py3-pip \
    py3-wheel \
    py3-qt5 \
    py3-pillow \
    openblas-dev \
    freetype-dev \
    libpng-dev \
    bzip2-dev \
    zlib-dev \
    harfbuzz-dev

RUN apk add --no-cache --virtual build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    py3-numpy-dev \
    py3-scipy

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN ln -s /usr/include/freetype2/ft2build.h /usr/include/ft2build.h

ENV PYTHONPATH /usr/lib/python3.8/site-packages/

RUN git clone --depth 1 https://github.com/matplotlib/matplotlib.git /matplotlib
WORKDIR /matplotlib
RUN python3 setup.py install

ENV PYFDA_REVISION develop
RUN git clone --depth 1 --branch ${PYFDA_REVISION} https://github.com/chipmuenk/pyfda.git /pyfda

WORKDIR /pyfda

RUN python3 setup.py install --prefix=/opt/pyfda

