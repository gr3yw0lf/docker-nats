DOCKERFILE_FOLDER=.
OWNER=gr3yw0lf
NAME=gnatsd
VERSION=$(shell cat version)

TAG=${OWNER}/${NAME}:${VERSION}

RUNNAME=gnatsd_1
OPTS=-p 4222:4222 -p 8222:8222 -p 4248:4248 --volumes-from ${RUNNAME}_data
OPTS_DEBUG=-P -v `pwd`/data:/data


build: Dockerfile gnatsd
	docker build -t ${TAG} ${DOCKERFILE_FOLDER}

run-debug: 
	docker run --rm ${OPTS_DEBUG} -it ${TAG} /bin/ash
run-debug-volume: 
	docker run --rm ${OPTS_DEBUG} --volumes-from ${RUNNAME}_data -it ${TAG} /bin/ash

run-name: 
	docker run ${OPTS} --name=${RUNNAME} -d ${TAG} 

dir-data:
	mkdir -p data

data-volume:
	docker run --name=${RUNNAME}_data ${TAG} echo

gnatsd:
	./buildGnatsd.sh master
