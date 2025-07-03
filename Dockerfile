FROM apache/superset:latest

# Switch to root to install dependencies
USER root

# Install additional dependencies
RUN pip install --no-cache-dir \
    psycopg2-binary \
    pandas \
    redis

# Copy configuration
COPY superset_config.py /app/pythonpath/superset_config.py
COPY init_superset.sh /app/init_superset.sh

# Make init script executable
RUN chmod +x /app/init_superset.sh

# Create data directory
RUN mkdir -p /app/data
COPY data/ /app/data/

# Switch back to superset user
USER superset

# Set environment variables
ENV SUPERSET_CONFIG_PATH=/app/pythonpath/superset_config.py
ENV PYTHONPATH=/app/pythonpath:$PYTHONPATH

# Expose port
EXPOSE 8088

# Run initialization script
CMD ["/app/init_superset.sh"]
