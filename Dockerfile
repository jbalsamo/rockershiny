FROM rocker/shiny

RUN echo "Start Updates"
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade
RUN \
    apt-get install -y net-tools && \
    apt-get install -y git curl wget vim systemctl
COPY scripts /usr/local
RUN mkdir /mnt/data
ENV HOME /root
WORKDIR /root
EXPOSE 3838 80 443 22 8787
CMD ["tail -f /dev/null"]
