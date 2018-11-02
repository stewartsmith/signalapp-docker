FROM ubuntu:xenial
ARG UNAME=stewart
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
ENV DEBIAN_FRONTEND noninteractive
# Perform an initial update, then download wget and gnupg
RUN apt-get update \
    && apt-get install -y \
    wget curl apt-transport-https \
    gnupg
RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list
RUN apt update && apt install -y signal-desktop
USER $UNAME
ENTRYPOINT ["/opt/Signal/signal-desktop"]
