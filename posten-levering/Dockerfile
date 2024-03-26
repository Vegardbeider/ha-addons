ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements
RUN \
    apk add --no-cache \
    python3 \
    py3-pip

# Copy data for add-on
COPY . /
RUN chmod a+x /run.sh \
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && pip install -r /app/requirements.txt \
    && crontab /app/crontab

CMD [ "/run.sh" ]