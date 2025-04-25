FROM python:3.9-slim

# 1. Install system dependencies including Git
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python3-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 2. Install Gramps Web from GitHub
RUN pip install git+https://github.com/gramps-project/gramps-web.git

# 3. Set up application
WORKDIR /app
COPY family_tree.gpkg /app/static/

# 4. Run Gramps Web
CMD ["python", "-m", "gramps_web", "--host=0.0.0.0", "--port=5000"]