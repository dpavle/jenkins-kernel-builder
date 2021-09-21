FROM jenkins/jenkins

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
	libssl-dev  

# install thinBackup plugin
RUN jenkins-plugin-cli --plugins thinBackup

# drop back to jenkins user (good practice) 
USER jenkins

