FROM tomcat:9
EXPOSE 8080
RUN mv /usr/local/tomcat/webapps.dist/** /usr/local/tomcat/webapps
VOLUME  ["/usr/local/tomcat/"]
WORKDIR /usr/local/tomcat/webapps/ROOT/
RUN rm -rf index.jsp
#COPY ./index.jsp index.jsp
CMD ["catalina.sh", "run"]
