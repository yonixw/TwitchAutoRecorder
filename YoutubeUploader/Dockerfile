FROM  nikolaik/python-nodejs:python3.7-nodejs12

RUN mkdir -p /src/app/allrecords

USER root
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y unzip wget 
RUN pip install --upgrade oauth2client progressbar2

# Fix from bug here:https://github.com/tokland/youtube-upload/issues/262
RUN pip install -Iv google-api-python-client==1.7.4


WORKDIR /src/app
RUN wget https://github.com/tokland/youtube-upload/archive/master.zip
RUN unzip master.zip && rm master.zip

WORKDIR /src/app/youtube-upload-master
RUN python setup.py install

WORKDIR /src/app
ADD ./ /src/app/

CMD bash ./main.sh

