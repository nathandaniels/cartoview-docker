FROM ubuntu:16.04
ENV TERM xterm
RUN apt-get update
RUN locale-gen ru_RU.UTF-8 && update-locale
RUN apt-get -qq -y install wget curl git vim build-essential build-essential python-dev postgresql-client
RUN apt-get install software-properties-common python-software-properties -y
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable 
RUN apt-get update
RUN apt-get upgrade
RUN apt-get  install gdal-bin python-gdal -y
RUN apt-get install python-pip -y
RUN pip install GDAl
RUN apt-get update && apt-get install -y \
		gcc \
		gettext \
		libpq-dev \
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
RUN pip install geonode==2.5.15
RUN pip install cartoview
RUN pip install django-geonode-client
RUN pip install Uwsgi
CMD ["/bin/bash"]
