FROM gliderlabs/alpine:3.4

MAINTAINER Grey Whittney <grey@gr3yw0lf.com>

# RUN apk-install --update nginx

RUN mkdir -p /usr/local /etc/gnatsd/ssl

COPY gnatsd /usr/local/bin/gnatsd
COPY gnatsd.conf.blank /etc/gnatsd/gnatsd.conf
COPY entrypoint.gnatsd.sh /entrypoint.gnatsd.sh
RUN chmod a+x /usr/local/bin/gnatsd /entrypoint.gnatsd.sh

VOLUME /etc/gnatsd

# 4222 for nats
# 4248 for routes
# 8222 for monitoring
EXPOSE 4222 4248 8222 

ENV CONFIG=/etc/gnatsd/gnatsd.conf
ENV OPTIONS=-D



ENTRYPOINT ["/entrypoint.gnatsd.sh"]

