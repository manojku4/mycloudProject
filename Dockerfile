FROM tomcat:jdk8
LABEL maintainer="manojku4"
ADD datasecurity.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]