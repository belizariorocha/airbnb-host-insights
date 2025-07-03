FROM apache/superset:3.0.0

ENV SUPERSET_ENV=production

COPY superset_config.py /app/pythonpath/

USER root
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt

USER superset
