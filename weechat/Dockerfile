FROM ubuntu:14.04
MAINTAINER Jack Meredith <jackusm95@gmail.com>


ENV _clean="rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*"
ENV _apt_clean="eval apt-get clean && $_clean"
# apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y


RUN apt-get update && apt-get install -y \
    weechat \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Setup weechat user
RUN groupadd -o -g 3333 weechat \
 && useradd -o -u 3333 -g weechat --shell /bin/bash -d ~/.weechat weechat \
 && install -o weechat -g weechat -d ~/.weechat


# let irssi and weechat users sudo without password
RUN echo "weechat ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


# Default container settings
USER weechat
EXPOSE 6697
ENTRYPOINT ["weechat"]