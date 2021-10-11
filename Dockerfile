### jenkins-kernel-builder ###

FROM jenkins/jenkins:lts-jdk11

USER root 

# update repo cache
RUN apt-get update -y

# install kernel build dependencies
RUN apt-get install -y \
	git \
	g++ \
	gcc \
	zip \	
	make \
	ccache \
	flex \ 
	bc \
	kmod \
	wget \
	libssl-dev  

## ccache ########################################################

# Update symlinks
RUN /usr/sbin/update-ccache-symlinks

# Prepend ccache into the PATH
RUN echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc

##################################################################

# install thinBackup plugin
RUN jenkins-plugin-cli --plugins thinBackup

# drop back to jenkins user (good practice) 
USER jenkins

