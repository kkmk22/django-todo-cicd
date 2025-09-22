FROM python:3.11

WORKDIR /data

# Install build tools (pip, etc.)
RUN apt-get update && apt-get install -y build-essential

# Install Django
RUN pip install django==3.2

COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
