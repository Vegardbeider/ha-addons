ARG BUILD_FROM
FROM $BUILD_FROM

# Compile telldus-core source

WORKDIR /usr/src/

COPY telldus-core-mqtt/telldus /usr/src/telldus

RUN apk add --no-cache \
      confuse \
      libftdi1 \
      libstdc++

RUN apk add --no-cache --virtual .build-dependencies \
      confuse-dev \
      cmake \
      gcc \
      g++ \
      libftdi1-dev \
      libtool \
      make \
      musl-dev \
    && cd telldus/telldus-core \
    && cmake . -DBUILD_LIBTELLDUS-CORE=ON -DBUILD_TDADMIN=OFF -DBUILD_TDTOOL=ON -DFORCE_COMPILE_FROM_TRUNK=ON \
    && make -j$(nproc) \
    && make \
    && make install \
    && apk del .build-dependencies \
    && rm -rf /usr/src/telldus

# telldus-core-mqtt

WORKDIR /usr/src/telldus-core-mqtt

COPY telldus-core-mqtt/requirements.txt ./

RUN python3 -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1
RUN ln -s /usr/local/bin/tellcore_events /usr/bin/tdevents \
    && ln -s /usr/local/bin/tellcore_controllers /usr/bin/tdcontroller

COPY telldus-core-mqtt/main.py ./
COPY telldus-core-mqtt/config_default.yaml ./
COPY telldus-core-mqtt/logging.yaml ./
COPY telldus-core-mqtt/src ./src

# supervisord

COPY telldus-core-mqtt/supervisord.conf /etc/supervisord.conf

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

