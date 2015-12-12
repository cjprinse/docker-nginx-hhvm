FROM cprinse/docker-nginx:0.1

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"
RUN apt-get update && apt-get install -y hhvm

ADD docker/my_init.d/ etc/my_init.d
RUN chmod -R 700 /etc/my_init.d

ADD docker/service/ /etc/service/
RUN chmod -R 700 /etc/service/
