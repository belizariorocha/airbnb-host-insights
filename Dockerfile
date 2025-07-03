FROM apache/superset:3.0.0

ENV SUPERSET_ENV=production

COPY superset_config.py /app/pythonpath/
COPY requirements.txt /app/requirements.txt
COPY init_superset.sh /app/init_superset.sh
RUN chmod +x /app/init_superset.sh

USER root
RUN pip install --no-cache-dir -r /app/requirements.txt
USER superset

CMD ["/app/init_superset.sh"]
