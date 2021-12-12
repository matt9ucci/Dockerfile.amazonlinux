ARG BASE_IMAGE=public.ecr.aws/amazonlinux/amazonlinux:2
FROM $BASE_IMAGE

RUN set -x \
 && yum update -q -y --obsoletes \
 && yum install -q -y --obsoletes \
	bash-completion \
	gzip \
	shadow-utils \
	sudo \
	tar \
 && yum clean all

# Install awstoe
# See https://docs.aws.amazon.com/imagebuilder/latest/userguide/toe-get-started.html
ARG AWS_REGION=ap-northeast-1
RUN set -x \
 && curl -sO https://awstoe-${AWS_REGION}.s3.${AWS_REGION}.amazonaws.com/latest/linux/amd64/awstoe \
 && mv awstoe /usr/local/bin \
 && chmod 755 /usr/local/bin/awstoe

# Add ec2-user
ARG USER_NAME=ec2-user
ARG USER_ID=1000
RUN set -ux \
 && useradd -u $USER_ID $USER_NAME \
 && echo "$USER_NAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER_NAME

USER $USER_NAME
