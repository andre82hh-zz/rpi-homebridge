FROM hypriot/rpi-node:7.3

RUN apt-get update
RUN apt-get install libavahi-compat-libdnssd-dev
RUN npm install -g --unsafe-perm homebridge hap-nodejs node-gyp
RUN cd /usr/local/lib/node_modules/homebridge/ && npm install --unsafe-perm bignum
RUN cd /usr/local/lib/node_modules/hap-nodejs/node_modules/mdns/ && node-gyp BUILDTYPE=Release rebuild
