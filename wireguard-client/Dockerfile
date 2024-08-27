ARG BUILD_FROM
FROM $BUILD_FROM

# Install wireguard
RUN apk add --no-cache \
    wireguard-tools \
    supervisor

# Copy supervisord config
COPY rootfs/supervisord.conf /etc/supervisord.conf

# Copy run script
COPY rootfs/run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]