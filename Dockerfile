FROM 0x01be/pyfda:build as build

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

