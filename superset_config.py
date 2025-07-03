import os
from urllib.parse import urlparse

# Database configuration
DATABASE_URL = os.environ.get('DATABASE_URL')
if DATABASE_URL:
    url = urlparse(DATABASE_URL)
    SQLALCHEMY_DATABASE_URI = f"postgresql://{url.username}:{url.password}@{url.hostname}:{url.port}/{url.path[1:]}"
else:
    SQLALCHEMY_DATABASE_URI = 'sqlite:///superset.db'

# Security
SECRET_KEY = os.environ.get('SUPERSET_SECRET_KEY', 'your-secret-key-here')

# Redis configuration for caching
REDIS_URL = os.environ.get('REDIS_URL', 'redis://localhost:6379')

# Feature flags
FEATURE_FLAGS = {
    'ENABLE_TEMPLATE_PROCESSING': True,
    'DASHBOARD_NATIVE_FILTERS': True,
    'DASHBOARD_CROSS_FILTERS': True,
    'HORIZONTAL_FILTER_BAR': True,
}

# Security settings
WTF_CSRF_ENABLED = True
WTF_CSRF_TIME_LIMIT = None

# Superset configuration
SUPERSET_WEBSERVER_PORT = 8088
SUPERSET_WEBSERVER_HOST = '0.0.0.0'

# Email configuration (optional)
SMTP_HOST = os.environ.get('SMTP_HOST', 'localhost')
SMTP_STARTTLS = True
SMTP_SSL = False
SMTP_USER = os.environ.get('SMTP_USER', 'superset')
SMTP_PORT = 587
SMTP_PASSWORD = os.environ.get('SMTP_PASSWORD', 'superset')
SMTP_MAIL_FROM = os.environ.get('SMTP_MAIL_FROM', 'superset@localhost')

# Logging
LOG_LEVEL = 'INFO'

# Cache configuration
CACHE_CONFIG = {
    'CACHE_TYPE': 'redis',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_URL': REDIS_URL,
}

# Results backend
RESULTS_BACKEND = {
    'CACHE_TYPE': 'redis',
    'CACHE_DEFAULT_TIMEOUT': 86400,
    'CACHE_KEY_PREFIX': 'superset_results_',
    'CACHE_REDIS_URL': REDIS_URL,
}
