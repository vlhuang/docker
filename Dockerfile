#FROM node
FROM ubuntu

#FROM alpine/git:latest
#CMD ["git", "latest"]

#Install OpenJDK-8

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get -y install git

#    apt-get install -y ant &&

#    apt-get clean;

# Setup JAVA_HOME -- useful for docker commandline

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN export JAVA_HOME

RUN mkdir /app

WORKDIR /app

COPY package.json .

RUN npm install

CMD ["npm", "start"]

COPY HelloJava.java /app

# Compile our HelloWorld

RUN javac HelloJava.java
#CMD ["echo", "hello world!"]

#ENTRYPOINT java HelloJava
