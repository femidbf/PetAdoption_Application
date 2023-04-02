FROM openjdk:8
COPY spring-petclinic-2.4.2.war /app
COPY ./newrelic/newrelic.jar  /app
COPY ./newrelic/newrelic.yml  /app 
ENV NEW_RELIC_APP_NAME="pet-bank-femi"
ENV NEW_RELIC_LICENSE_KEY="eu01xx7c0963548bf7c1e0573aa71a97340aNRAL"
ENV NEW_RELIC_LOG_FILE_NAME="STDOUT"
ENTRYPOINT ["java","-javaagent:/app/newrelic.jar","-jar","spring-petclinic-2.4.2.war","--server.port=8085"]

# FROM openjdk
# FROM ubuntu 
# FROM tomcat
# COPY **/*.war /usr/local/tomcat/webapps
# WORKDIR  /usr/local/tomcat/webapps
# RUN apt update -y && apt install curl -y
# RUN curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && \
#     apt-get install unzip -y  && \
#     unzip newrelic-java.zip -d  /usr/local/tomcat/webapps
# ENV JAVA_OPTS="$JAVA_OPTS -javaagent:app/newrelic.jar"
# ENV NEW_RELIC_APP_NAME="PCDEUteam2"
# ENV NEW_RELIC_LOG_FILE_NAME=STDOUT
# ENV NEW_RELIC_LICENCE_KEY="eu01xx4fc443b5ef136bb617380505f93e08NRAL"
# WORKDIR  /usr/local/tomcat/webapps
# RUN pwd && ls -al
# ENTRYPOINT ["java", "-javaagent:/usr/local/tomcat/webapps/newrelic/newrelic.jar", "-jar", "spring-petclinic-2.4.2.war", "--server.port=8085"]
