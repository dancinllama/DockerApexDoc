FROM dancinllama/forcetoolkit
MAINTAINER James Loghry <jwl007@gmail.com>
RUN wget https://github.com/dancinllama/DockerApexDoc/raw/master/apexdoc.jar

RUN apt-get update

# Install software 
RUN apt-get install -y git
# Make ssh dir
RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
ADD docker_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
