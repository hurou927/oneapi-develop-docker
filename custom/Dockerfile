FROM intel/oneapi-basekit


ARG USERNAME=${USERNAME}
ARG GROUPNAME=${GROUPNAME}
ARG UID=${UID}
ARG GID=${GID}
ARG RENDERGID=${RENDERGID}

RUN apt-get -y update
RUN apt-get -y install \
  jq \
  sudo \
  wget \
  zsh \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

# Install neovim
RUN  url=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest  | jq '[.assets[] | select(.name == "nvim-linux64.tar.gz")][0].browser_download_url' -r) \
  && wget "$url" -O /tmp/neovim_tar \
  && tar xvf /tmp/neovim_tar -C /
RUN ln -sf /nvim-linux64/bin/nvim /usr/bin/nvim
RUN rm -rf /tmp/neovim_tar

RUN groupadd -g $GID $GROUPNAME
RUN useradd -m -s /bin/zsh -u $UID -g $GID $USERNAME
# sudo
RUN echo $USERNAME:$USERNAME | chpasswd && adduser $USERNAME sudo

# To use GPU
RUN gpasswd -a $USERNAME video
RUN groupadd -g $RENDERGID render
RUN gpasswd -a $USERNAME render


RUN mkdir -p /home/root/workspace
RUN mkdir -p /home/$USERNAME/workspace
RUN chown -R  $USERNAME:$GROUPNAME /home/$USERNAME/workspace
