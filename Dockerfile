FROM python:3.10

WORKDIR /app

# Install system dependencies (optional but useful)
RUN apt-get update && apt-get install -y gcc default-libmysqlclient-dev

# Copy requirements (create this file if not present)
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Flask port
EXPOSE 5000

# Environment variables (optionals)
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run application
CMD ["python", "app.py"]
