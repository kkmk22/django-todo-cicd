FROM python:3

WORKDIR /data

# Install distutils
RUN apt-get update && apt-get install -y python3-venv build-essential

# Install Django
RUN pip install django==3.2

COPY . .

RUN python manage.py migrate

EXPOSE 8000
