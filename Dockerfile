FROM 0x01be/pyfda:build as build

FROM 0x01be/xpra

COPY --from=build /opt/pyfda/ /opt/pyfda/
COPY --from=build /usr/lib/python3.8/site-packages/ /usr/lib/python3.8/site-packages/

USER root
RUN apk --no-cache add --virtual pyfda-runtime-dependencies \
    mesa-dri-swrast \
    qt5-qtbase \
    qt5-qtbase-x11 \
    python3 \
    py3-pip \
    py3-parsing \
    py3-six \
    libpng \
    bzip2 \
    zlib \
    harfbuzz \
    openblas

RUN pip3 install -U certifi

RUN mkdir -p /tmp/.X11-unix

ENV PATH $PATH:/opt/pyfda/bin/
ENV PYTHONPATH /usr/lib/python3.8/site-packages/:/opt/pyfda/lib/python3.8/site-packages/

WORKDIR /workspace

ENV COMMAND "pyfdax"

