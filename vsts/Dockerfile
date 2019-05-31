FROM microsoft/vsts-agent:ubuntu-16.04-docker-18.06.1-ce-standard

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# The following are cypress.io dependencies: https://docs.cypress.io/guides/guides/continuous-integration.html#Advanced-setup
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        xvfb \
        libgtk2.0-0 \
        libnotify-dev \
        libgconf-2-4 \
        libnss3 \
        libxss1 \
        libasound2