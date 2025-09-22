FROM python:3.12-slim

WORKDIR /data

# Install required system packages
RUN apt-get update && apt-get install -y \
    python3-venv \
    build-essential \
    && python3 -m ensurepip \
    && rm -rf /var/lib/apt/lists/*

# Install Django
RUN pip install --upgrade pip
RUN pip install django==3.2

# Copy project files
COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
