# -*- coding: utf-8 -*-
FROM ubuntu:18.04

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y python3-pip python3.8 locales

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Install pipenv
RUN pip3 install pipenv

# Setup workdir
WORKDIR /usr/src/dummy-test-automation

# Copy code to workdir
COPY . .

# Install python dependencies
RUN pipenv install --system --deploy --ignore-pipfile

# Run test
ENTRYPOINT [ "pytest" ]