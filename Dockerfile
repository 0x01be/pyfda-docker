FROM alpine as build

RUN apk --no-cache add --virtual pyfda-build-dependencies \
    git \
    build-base \
    qt5-qtbase-dev \
    python3-dev \
    py3-pip \
    py3-wheel \
    py3-numpy-dev \
    py3-scipy \
    py3-qt5 \
    py3-pillow \
    openblas-dev \
    freetype-dev \
    libpng-dev \
    bzip2-dev \
    zlib-dev \
    harfbuzz-dev

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

ENV PYFDA_REVISION develop
RUN git clone --depth 1 --branch ${PYFDA_REVISION} https://github.com/chipmuenk/pyfda.git /pyfda

WORKDIR /pyfda

RUN pip3 install --prefix=/opt/pyfda -e .

