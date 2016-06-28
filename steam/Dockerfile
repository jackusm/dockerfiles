FROM tianon/steam
MAINTAINER Jack Meredith <jackusm95@gmail.com>

# let's head off a few of the things steam will want to install immediately
RUN sudo apt-get update && \
	sudo apt-get install -yq && \
	sudo rm -r /var/lib/apt/lists/*