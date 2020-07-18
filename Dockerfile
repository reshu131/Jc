FROM centos
ARG user=ris
ARG group=ris
ARG uid=1000
ARG gid=1000

RUN groupadd  ${group} \
    && useradd -G ${group} -s /bin/bash  ${user}

USER ${user}

RUN yum install java-1.8.0-openjdk-devel -y
RUN curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo |  tee /etc/yum.repos.d/jenkins.repo
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install jenkins -y
RUN yum install git -y
EXPOSE 8080 80
CMD java -jar /usr/lib/jenkins/jenkins.war
