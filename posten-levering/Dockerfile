ARG BUILD_FROM
FROM $BUILD_FROM

# Copy data for add-on
COPY . /
RUN chmod a+x /run.sh \
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && pip install -r /app/requirements.txt \
    && crontab /app/crontab

CMD [ "/run.sh" ]