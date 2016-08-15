#!/bin/bash
BASEDIR='../../data/subtleKnife'
WGET_OPTS='-nc'

mkdir ${BASEDIR}/hg19
mkdir ${BASEDIR}/hg19/config
mkdir ${BASEDIR}/hg19/session


wget ${WGET_OPTS} --directory-prefix=${BASEDIR}/hg19/config \
    https://raw.githubusercontent.com/epgg/eg/master/config/hg19/tracks.json \
    https://raw.githubusercontent.com/epgg/eg/master/config/hg19/publichub.json

wget ${WGET_OPTS} --directory-prefix=${BASEDIR}/seq \
    http://epgg-test.wustl.edu/installdata/hg19.gz \
    http://epgg-test.wustl.edu/installdata/hg19.gz.tbi

cd ${BASEDIR}/hg19
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/refGene.gz
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/refGene.gz.tbi
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/gencodeV19.gz
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/gencodeV19.gz.tbi
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/xenoRefGene.gz
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/xenoRefGene.gz.tbi
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/rmsk_ensemble.gz
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/rmsk_ensemble.gz.tbi
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/rmsk_all.gz
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/rmsk_all.gz.tbi
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/cpgisland.gz
wget ${WGET_OPTS} http://egg.wustl.edu/d/hg19/cpgisland.gz.tbi

wget ${WGET_OPTS} http://epgg-test.wustl.edu/installdata/hg19/rmsk.tgz
tar xzf rmsk.tgz

wget ${WGET_OPTS} \
    http://egg.wustl.edu/d/hg19/gc5Base.bigWig \
    http://egg.wustl.edu/d/hg19/placentalphastCons46way.gz \
    http://egg.wustl.edu/d/hg19/placentalphastCons46way.gz.tbi \
    http://egg.wustl.edu/d/hg19/placentalphyloP46way.gz \
    http://egg.wustl.edu/d/hg19/placentalphyloP46way.gz.tbi \
    http://egg.wustl.edu/d/hg19/primatephastCons46way.gz \
    http://egg.wustl.edu/d/hg19/primatephastCons46way.gz.tbi \
    http://egg.wustl.edu/d/hg19/primatephyloP46way.gz \
    http://egg.wustl.edu/d/hg19/primatephyloP46way.gz.tbi \
    http://egg.wustl.edu/d/hg19/vertebratephastCons46way.gz \
    http://egg.wustl.edu/d/hg19/vertebratephastCons46way.gz.tbi \
    http://egg.wustl.edu/d/hg19/vertebratephyloP46way.gz \
    http://egg.wustl.edu/d/hg19/vertebratephyloP46way.gz.tbi

wget ${WGET_OPTS} \
    http://egg.wustl.edu/d/hg19/wgEncodeCrgMapabilityAlign100mer.bigWig \
    http://egg.wustl.edu/d/hg19/wgEncodeCrgMapabilityAlign24mer.bigWig \
    http://egg.wustl.edu/d/hg19/wgEncodeCrgMapabilityAlign36mer.bigWig \
    http://egg.wustl.edu/d/hg19/wgEncodeCrgMapabilityAlign40mer.bigWig \
    http://egg.wustl.edu/d/hg19/wgEncodeCrgMapabilityAlign50mer.bigWig \
    http://egg.wustl.edu/d/hg19/wgEncodeCrgMapabilityAlign75mer.bigWig 
