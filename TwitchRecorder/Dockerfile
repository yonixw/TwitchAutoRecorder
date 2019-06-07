FROM  nikolaik/python-nodejs:python3.7-nodejs12

RUN mkdir -p /src/app
RUN mkdir -p /src/app/inprogress
RUN mkdir -p /src/app/allrecords

ENV USERNAME lirik
#run youtube-dl -F https://www.twitch.tv/????? to find:
ENV QUALITY 720

USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y ffmpeg

# install youtube-dl for stream
RUN pip3 install youtube-dl
RUN pip3 show youtube-dl
RUN alias youtube-dl=/usr/local/lib/python3.7/site-packages/youtube-dl

WORKDIR /src/app

# install websockets for chat
RUN pwd && npm install ws --save

# Copy all files
ADD ./ /src/app/

CMD bash ./main.sh




