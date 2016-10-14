# docker-nats

Alpine based container of nats-io/nats-docker (https://github.com/nats-io/nats-docker)

Volume exposed: /etc/gnatsd
(allows a data volume to be built with config, or mapped host dir)

### To Build

$ make

### To Make data volume

$ make data-volume

### To run

$ make run-name

