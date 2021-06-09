FROM tomcat:jdk8
LABEL maintainer="manojku4"
ADD * /usr/local/tomcat/webapps/datasecurity/
EXPOSE 8080
CMD ["catalina.sh", "run"]
