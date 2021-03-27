FROM ubuntu:java
#RUN apt-get -y install openjdk-11-jdk
RUN useradd -ms /bin/bash rocketlv \
	&& apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install wget
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.4/bin/apache-tomcat-10.0.4.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.0.4/* /usr/local/tomcat/
EXPOSE 8080
VOLUME  ["/usr/local/tomcat/"]
WORKDIR /usr/local/tomcat/
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
