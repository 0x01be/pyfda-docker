FROM 0x01be/pyfda:build as build

FROM 0x01be/xpra

COPY --from=build /opt/pyfda/ /opt/pyfda/

USER root
RUN apk --no-cache add --virtual pyfda-runtime-dependencies \
    qt5-qtbase \
    qt5-qtbase-x11 \
    python3 \
    py3-setuptools \
    py3-numpy \
    py3-scipy \
    py3-qt5 \
    py3-pillow \
    py3-parsing \
    py3-six \
    libpng \
    bzip2 \
    zlib \
    harfbuzz \
    openblas

USER xpra

ENV PATH $PATH:/opt/pyfda/bin/
ENV PYTHONPATH /usr/lib/python3.8/site-packages/:/opt/pyfda/lib/python3.8/site-packages/

WORKDIR /workspace

ENV COMMAND "pyfdax"

