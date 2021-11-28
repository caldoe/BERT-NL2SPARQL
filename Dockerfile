FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y python3.8 python3-pip python-is-python3

RUN python --version
RUN pip --version

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

RUN ./scripts/lcquad/bert/202_train.sh
#RUN ./scripts/lcquad/rnn/201_train.sh
#RUN ./scripts/websp/101_train.sh

#RUN ./run.sh
#CMD [ "run.sh"]