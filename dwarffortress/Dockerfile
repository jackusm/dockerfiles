FROM ansible/ubuntu14.04-ansible:stable
MAINTAINER Ben Cawkwell <bencawkwell@gmail.com>

# Install core
ENV DFPKGS unzip
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y $DFPKGS

# Add the ansible playbooks from github
ADD https://github.com/bencawkwell/ansible-dwaffortress/archive/v0.1.0.zip /ansible.zip
RUN unzip /ansible.zip
RUN ln -s /ansible-dwaffortress-0.1.0

# Run each playbook
RUN cd /ansible-dwaffortress-0.1.0 && ansible-playbook dwarffortress.yml --connection=local

# Comment the line below if you do not want dfhack
RUN cd /ansible-dwaffortress-0.1.0 && ansible-playbook dfhack.yml --connection=local

# Uncomment the line below if you want to use the Phoebus tile set
RUN cd /ansible-dwaffortress-0.1.0 && ansible-playbook tileset-phoebus.yml --connection=local

# Only pick ONE of the following display options:

# 2D mode using noVNC (control via a browser)
RUN cd /ansible-dwaffortress-0.1.0 && ansible-playbook novnc.yml --connection=local

# 2D mode using XPRA
#RUN cd /ansible-dwaffortress-0.1.0 && ansible-playbook xpra.yml --connection=local

# TEXT mode (in the console)
#RUN cd /ansible-dwaffortress-0.1.0 && ansible-playbook textmode.yml --connection=local

# Add scripts
ADD https://github.com/bencawkwell/supervisor-tools/raw/master/wait-for-daemons.sh /wait-for-daemons.sh
ADD start.sh /start.sh
RUN chmod +x /wait-for-daemons.sh /start.sh

ENV LANG C.UTF-8
VOLUME ["/df_linux/data/save"]

ENTRYPOINT ["/start.sh"]
