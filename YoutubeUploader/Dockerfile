FROM  nikolaik/python-nodejs:python3.7-nodejs12

RUN mkdir -p /src/app/allrecords

USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y unzip wget 
RUN pip install --upgrade google-api-python-client oauth2client progressbar2

WORKDIR /src/app

RUN wget https://github.com/tokland/youtube-upload/archive/master.zip
RUN unzip master.zip && rm master.zip
RUN alias youtube-upload="python3 /src/app/youtube-upload-master/bin/youtube-upload"

ADD ./ /src/app/

CMD bash ./main.sh

