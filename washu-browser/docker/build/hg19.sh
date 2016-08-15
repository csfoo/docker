#!/bin/bash
# This only does the DB and config setup.
# You need to run hg19_local.sh to download all the data, then mount it at:
# /srv/epgg/data/data/subtleKnife/hg19
# when running the container.

mkdir /srv/epgg/data/data/subtleKnife/hg19
mkdir /srv/epgg/data/data/subtleKnife/hg19/config
mkdir /srv/epgg/data/data/subtleKnife/hg19/session
chown www-data.www-data /srv/epgg/data/data/subtleKnife/hg19/session

cd /eg
cp config/hg19/tracks.json /srv/epgg/data/data/subtleKnife/hg19/config
cp config/hg19/publichub.json /srv/epgg/data/data/subtleKnife/hg19/config

cd /eg/config
service mysql start
mysql -u hguser --password=hguser -e "create database hg19;"
cd hg19
cat makeDb.sql ../sessionUtils.sql | mysql -u hguser --password=hguser hg19 --local-infile=1

cd /load/hg19
cat load.sql | mysql -u hguser --password=hguser hg19 --local-infile=1
