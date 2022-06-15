FROM python:3.9-slim-buster

WORKDIR /app
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/run.py .
COPY src/app ./app

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]