FROM fedora:43
MAINTAINER sparticvs@popebp.com

RUN dnf update -y && dnf install -y arm-image-installer

ENTRYPOINT ["/usr/bin/arm-image-installer"]
CMD ["--version"]
