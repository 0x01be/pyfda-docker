FROM alpine as build

RUN apk --no-cache add --virtual pyfda-build-dependencies \
    build-base \
    python3-dev \
    py3-pip \
    py3-numpy \
    qt5-qtbase-dev \
    openblas-dev

RUN pip install pyfda --prefix=/opt/pyfda

FROM 0x01be/xpra

COPY --from=build /opt/pyfda/ /opt/pyfda/

RUN apk --no-cache add --virtual inspectrum-runtime-dependencies \
    qt5-qtbase \
    qt5-qtbase-x11 \
    python3 \
    py3-numpy

ENV PATH $PATH:/opt/pyfda/bin/
ENV PYTHONPATH /usr/lib/python3.8/site-packages/:/opt/pyfda/lib/python3.8/site-packages/

VOLUME /workspace
WORKDIR /workspace

ENV COMMAND "pyfdax"
