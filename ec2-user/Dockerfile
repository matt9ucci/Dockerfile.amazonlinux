ARG BASE_IMAGE=public.ecr.aws/amazonlinux/amazonlinux:2
FROM $BASE_IMAGE

RUN set -x \
 && yum update -q -y --obsoletes \
 && yum install -q -y --obsoletes \
	shadow-utils \
	sudo \
 && yum clean all

# Add ec2-user
ARG USER_NAME=ec2-user
ARG USER_ID=1000
RUN set -ux \
 && useradd -u $USER_ID $USER_NAME \
 && echo "$USER_NAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER_NAME

USER $USER_NAME
