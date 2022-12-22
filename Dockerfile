FROM ubuntu:20.04

ENV S3_MOUNT_POINT /var/s3fs

ARG S3FS_VERSION=v1.91

RUN apt update
RUN apt install -y s3fs bash curl

COPY entrypoint.sh entrypoint.sh
COPY run.sh run.sh

RUN chmod +x entrypoint.sh
RUN chmod +x run.sh

CMD ./run.sh

ENTRYPOINT [ "./entrypoint.sh" ]
