FROM jenkinsxio/builder-base:latest

#Maven
ENV MAVEN_VERSION 3.6.0
WORKDIR /opt
# install maven
RUN wget http://integral-share-701990001.ap-southeast-1.elb.amazonaws.com/nexus/service/local/repositories/zurich-integral-group/content/com/csc/il/apache-maven/3.6.0/apache-maven-3.6.0-bin.zip -O ./apache-maven-3.6.0-bin.tar.gz
RUN tar -xzvf ./apache-maven-3.6.0-bin.tar.gz

# add nexus to maven
RUN wget http://integral-share-701990001.ap-southeast-1.elb.amazonaws.com/nexus/service/local/repositories/zurich-integral-group/content/com/csc/hkmc/maven/settings/1.0/settings-1.0.xml -O ./apache-maven-$MAVEN_VERSION/conf/settings.xml
ENV M2_HOME /opt/apache-maven-$MAVEN_VERSION
ENV maven.home $M2_HOME
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH

CMD ["mvn","-version"]

