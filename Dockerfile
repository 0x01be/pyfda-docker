FROM alpine as build

RUN apk --no-cache add --virtual pyfda-build-dependencies \
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
RUN pip install --upgrade pip

RUN pip install pyfda --prefix=/opt/pyfda

