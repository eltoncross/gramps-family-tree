FROM python:3.9-slim

# Install system dependencies and Gramps
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    build-essential \
    && pip install --no-cache-dir gramps-web \
    && apt-get purge -y --auto-remove python3-dev build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create app directory and copy files
WORKDIR /app
COPY family_tree.gpkg /app/static/

# Run Gramps Web directly (no Gunicorn)
CMD ["python3", "-m", "gramps_web", "--host=0.0.0.0", "--port=5000"]