FROM python:3.10-slim

WORKDIR /app

# Prevent Python from writing pyc files & buffering
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000


# Environment variables (optionals)
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run application

CMD ["python", "app.py"]
