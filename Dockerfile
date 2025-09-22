FROM python:3

WORKDIR /data

# Install required system packages for Django
RUN apt-get update && apt-get install -y \
    python3-distutils \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Install Django
RUN pip install django==3.2

# Copy project files
COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000

# Start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
