FROM alpine:3.3
MAINTAINER Jack Meredith <jackusm95@gmail.com>
RUN apk --no-cache add \
	ca-certificates

RUN wget http://static2.askmrrobot.com/amrbeta/client/AskMrRobotClient-45-ubuntu.14.04-x64.zip && \
	mkdir /AskMrRobotClient && \
	unzip -d /AskMrRobotClient AskMrRobotClient-45-ubuntu.14.04-x64.zip && \
	rm AskMrRobotClient-45-ubuntu.14.04-x64.zip && \
	cd AskMrRobotClient && \
	chmod +x client/amr && \
	chmod +x updater/amrupdate
RUN updater/amrupdate