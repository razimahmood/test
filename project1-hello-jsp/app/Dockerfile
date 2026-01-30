FROM tomcat:9.0-jdk17-temurin

# Clean default ROOT app and replace with ours
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
  && mkdir -p /usr/local/tomcat/webapps/ROOT

COPY webapps/ROOT/ /usr/local/tomcat/webapps/ROOT/
