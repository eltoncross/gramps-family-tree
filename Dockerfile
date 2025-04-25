FROM python:3.9-slim
RUN pip install gramps-web gunicorn
COPY family_tree.gpkg /app/static/
WORKDIR /app
CMD ["gunicorn", "-b :5000", "gramps_web:app"]