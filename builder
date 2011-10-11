#!/bin/sh

echo 'Checking if Jetty is already installed...'
if [ -d ~/jetty ]
then
    echo 'Jetty found.'
else
    echo 'Jetty not found. Installing it...'
    curl http://dotcloud-plugins.s3.amazonaws.com/jetty-distribution-8.0.2.v20111006.tar.gz |
        tar -C ~ -zxf-
    ln -s jetty-distribution-8.0.2.v20111006 ~/jetty
    echo 'Disabling test.war...'
    rm -f ~/jetty/webapps/test.war
    echo 'Jetty installed.'
fi

echo 'Checking if Solr is already installed...'
if [ -d ~/solr ]
then
    echo 'Solr found.'
else
    echo 'Solr not found. Installing it...'
    curl http://dotcloud-plugins.s3.amazonaws.com/apache-solr-3.4.0.tgz |
        tar -C ~ -zxf-
    ln -s apache-solr-3.4.0 ~/solr
    echo 'Solr installed. Copying WAR to webapps directory.'
    cp ~/solr/dist/apache-solr-3.4.0.war ~/jetty/webapps/ROOT.war
fi

mkdir -p ~/data

echo 'Installing Solr config...'
cp -a solrconfig/. ~/data/solr

echo 'Installing run script...'
cp run ~

echo 'Build complete.'
