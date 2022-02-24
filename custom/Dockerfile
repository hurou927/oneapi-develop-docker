FROM intel/oneapi-basekit


ARG USERNAME=${USERNAME}
ARG GROUPNAME=${GROUPNAME}
ARG UID=${UID}
ARG GID=${GID}
ARG RENDERGID=${RENDERGID}

RUN apt-get -y update
RUN apt-get -y install \
  sudo \
  zsh \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $GID $GROUPNAME
RUN useradd -m -s /bin/zsh -u $UID -g $GID $USERNAME
RUN gpasswd -a $USERNAME video

RUN groupadd -g $RENDERGID render
RUN gpasswd -a $USERNAME render
