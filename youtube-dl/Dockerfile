FROM crosbymichael/python

ENV YOUTUBE_DL_VERSION 2016.07.11
RUN pip install --upgrade youtube_dl && mkdir /download
WORKDIR /download
ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
