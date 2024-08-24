FROM ghcr.io/home-assistant/amd64-base-python:3.12-alpine3.20

# Copy data for add-on
COPY . /
RUN chmod a+x /run.sh \
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && pip install -r /app/requirements.txt \
    && crontab /app/crontab

CMD [ "/run.sh" ]