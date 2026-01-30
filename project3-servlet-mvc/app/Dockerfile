FROM tomcat:9.0-jdk17-temurin

RUN apt-get update && apt-get install -y findutils && rm -rf /var/lib/apt/lists/*

# Replace ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
  && mkdir -p /usr/local/tomcat/webapps/ROOT

# Copy JSP + WEB-INF (including web.xml)
COPY webapps/ROOT/ /usr/local/tomcat/webapps/ROOT/

# Copy Java source
COPY src/main/java/ /tmp/src/

# Compile Java servlets into WEB-INF/classes
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
  && javac -encoding UTF-8 \
    -cp "/usr/local/tomcat/lib/*:/usr/local/tomcat/lib/servlet-api.jar" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    $(find /tmp/src -name "*.java")
