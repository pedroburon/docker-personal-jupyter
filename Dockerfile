FROM python:3.7.3 AS requirements

RUN python -m venv /venv
COPY requirements.txt /

RUN /venv/bin/pip install -U pip
RUN /venv/bin/pip install jupyterlab
RUN /venv/bin/pip install -r /requirements.txt

FROM python:3.7.3 AS image

ENV PORT=8888

RUN useradd -d /src -s /bin/bash python
COPY --chown=python --from=requirements /venv /venv
USER python
WORKDIR /src

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["lab"]
