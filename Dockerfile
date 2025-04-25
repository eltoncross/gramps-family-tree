FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3-pip \
    && pip install gramps-web
COPY family_tree.gpkg /app/static/
WORKDIR /app
CMD ["gramps-web"]