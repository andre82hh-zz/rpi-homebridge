FROM hypriot/rpi-node:7.3

RUN apt-get update
RUN apt-get install libavahi-compat-libdnssd-dev libnss-mdns avahi-discover libkrb5-dev
RUN npm install -g --unsafe-perm homebridge hap-nodejs node-gyp
RUN cd /usr/local/lib/node_modules/homebridge/ && npm install --unsafe-perm bignum
RUN cd /usr/local/lib/node_modules/hap-nodejs/node_modules/mdns/ && node-gyp BUILDTYPE=Release rebuild

COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

RUN mkdir -p /var/run/dbus

ADD entrypoint.sh /entrypoint.sh

# Run container
##################################################
EXPOSE 5353 51826
CMD ["/entrypoint.sh"]
