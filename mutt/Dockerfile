# Run Mutt from a container
# From jess/docker

FROM alpine:edge
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN addgroup -g 1000 user \
	&& adduser -D -h /home/user -G user -u 1000 user

RUN apk --no-cache add \
	ca-certificates \
	elinks \
	git \
	gnupg \
	gpgme \
	lynx \
	mutt \
	mutt-doc \
	vim

# a browser is necessary!
ENV BROWSER lynx

ENV MUTT_VERSION 1.12.1

RUN apk --no-cache update && \
	apk --no-cache upgrade

USER user
ENV HOME /home/user
ENV TERM xterm-256color

# vim settings
RUN git clone https://github.com/jfrazelle/.vim.git $HOME/.vim \
	&& git clone https://github.com/altercation/vim-colors-solarized $HOME/.vim/bundle/vim-colors-solarized \
	&& cp $HOME/.vim/vimrc $HOME/.vimrc

ENV LANG C.UTF-8

CMD ["mutt", "-F", "~/.mutt/muttrc"]
