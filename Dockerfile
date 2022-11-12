FROM alpine:3.12

LABEL description "prometheus for ARMv6"
MAINTAINER mirceabenta

ARG version=2.40.1

RUN apk update apk add wget

RUN wget https://github.com/prometheus/prometheus/releases/download/v${version}/prometheus-${version}.linux-armv6.tar.gz \
  && tar xfz prometheus-${version}.linux-armv6.tar.gz \
  && mv prometheus-${version}.linux-armv6/ prometheus/ \
  && rm prometheus-${version}.linux-armv6.tar.gz

RUN mv /prometheus/prometheus.yml /prometheus/prometheus.yml.default

VOLUME ["/config","/prometheus/data"] 

EXPOSE 9090

COPY ./script/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
