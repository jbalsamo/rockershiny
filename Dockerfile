FROM rocker/shiny
RUN echo "Start Updates"
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade
RUN \
    apt-get install -y net-tools && \
    apt-get install -y git curl wget vim systemctl
RUN mkdir /usr/local/scripts
COPY scripts /usr/local/scripts
RUN mkdir /mnt/data
RUN ln -s /mnt/data /srv/shiny-server/myrscripts
ENV HOME /root
WORKDIR /root
EXPOSE 3838 80 443 22 8787
CMD ["/init"]
