# Ubuntu 14.04 tweaked
FROM phusion/baseimage:0.9.18

# ...put your own build instructions here...
RUN apt-get update && apt-get install -y \
    make \
    git \
    gcc \
    apache2 \
    mysql-server \
    libmysqlclient-dev \
    libmysqld-dev \
    unzip \
    r-base \
    zlib1g-dev \
    libncurses5-dev \
    libssl-dev \
    libghc-curl-dev \
    libssh2-1-dev \
    libssh2-1 \
    librsvg2-bin \
    libpng12-dev \
    wget

RUN a2enmod cgi

RUN git clone https://github.com/epgg/eg.git

WORKDIR /eg/cgi-bin
RUN cd jsmn-example && make
RUN cd jsmn && make
# Set the IP address of the mysql server
RUN sed -i '0,/#define Mysqlserver.*/s//#define Mysqlserver "localhost"/' subtleKnife.c
RUN make

RUN cp subtleKnife postdeposit /usr/lib/cgi-bin/
RUN cp ucsc2jsonhub.py /usr/lib/cgi-bin/

RUN mkdir -p /srv/epgg/data/data/subtleKnife/seq

RUN mkdir -p /var/www/html/browser/t
RUN mkdir /srv/epgg/data/trash
RUN chown www-data.www-data /var/www/html/browser/t /srv/epgg/data/trash
RUN ln -s /srv/epgg/data/trash /usr/lib/

WORKDIR /
RUN wget http://hgdownload.soe.ucsc.edu/admin/jksrc.zip
RUN unzip jksrc.zip
WORKDIR kent/src/
ENV MACHTYPE="x86_64"
ENV USE_SSL=1
RUN make libs

RUN mkdir utils/bwquery
WORKDIR utils/bwquery
RUN mv /eg/cgi-bin/bwquery/* .
RUN make kentSrc=../../
RUN mv bwquery /usr/lib/cgi-bin/

# browser setup
WORKDIR /eg/browser
RUN mv css /var/www/html/browser/
RUN mv js /var/www/html/browser/
RUN mv images /var/www/html/browser/
RUN mv index.html /var/www/html/browser/
WORKDIR /eg/config
RUN mv treeoflife /srv/epgg/data/data/subtleKnife/

# Create hguser mysql account
RUN service mysql start && \
    mysql -e "GRANT ALL ON *.* TO 'hguser'@'localhost' IDENTIFIED BY 'hguser' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Clone sql loading scripts to /load
WORKDIR /
RUN git clone https://github.com/epgg/load.git

# Setup the mysql daemon
RUN mkdir /etc/service/mysql
ADD build/mysql.sh /etc/service/mysql/run
RUN chmod +x /etc/service/mysql/run

# Setup the apache daemon
RUN mkdir /etc/service/apache2
ADD build/apache2.sh /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run

# hg19 support
ADD build/hg19.sh /eg/hg19.sh
RUN chmod +x /eg/hg19.sh
RUN /eg/hg19.sh

EXPOSE 22 80

# Use baseimage-docker's init system.
CMD /sbin/my_init

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
