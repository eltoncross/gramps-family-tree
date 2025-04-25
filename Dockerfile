FROM python:3.9-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Gramps Web directly from GitHub (official repo)
RUN pip install git+https://github.com/gramps-project/gramps-web.git

# Create app directory
WORKDIR /app
COPY family_tree.gpkg /app/static/

# Run Gramps Web
CMD ["python", "-m", "gramps_web", "--host=0.0.0.0", "--port=5000"]