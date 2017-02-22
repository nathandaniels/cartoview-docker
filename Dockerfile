FROM python:2.7.13

# Some stuff that everyone has been copy-pasting
# since the dawn of time.
ENV PYTHONUNBUFFERED 1

# Install some necessary things.
RUN apt-get update
RUN apt-get install -y swig libssl-dev dpkg-dev netcat gcc \
                gettext \
                postgresql-client libpq-dev \
                sqlite3 \
                python-gdal python-psycopg2 \
                python-imaging python-lxml \
                python-dev libgdal-dev \
                python-ldap \
                libmemcached-dev libsasl2-dev zlib1g-dev \
                python-pylibmc \
        --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /code
WORKDIR /code

# Install our requirements.
RUN pip install GDAL==1.10 --global-option=build_ext --global-option="-I/usr/include/gdal"
RUN pip install geonode==2.5.15
RUN pip install cartoview
RUN pip install django-geonode-client
RUN pip install Uwsgi
