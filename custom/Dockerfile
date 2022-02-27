FROM intel/oneapi-basekit


ARG USERNAME=${USERNAME}
ARG GROUPNAME=${GROUPNAME}
ARG UID=${UID}
ARG GID=${GID}
ARG RENDERGID=${RENDERGID}

RUN apt-get -y update
RUN apt-get -y install \
  git \
  jq \
  sudo \
  wget \
  zsh

# Install node
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get -y install nodejs

# Clean up
RUN apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

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


# Install neovim
RUN  url=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest  | jq '[.assets[] | select(.name == "nvim-linux64.tar.gz")][0].browser_download_url' -r) \
  && wget "$url" -O /tmp/neovim_tar \
  && tar xvf /tmp/neovim_tar -C /
RUN ln -sf /nvim-linux64/bin/nvim /usr/bin/nvim
RUN rm -rf /tmp/neovim_tar

# vim plug
RUN curl -fLo /home/$USERNAME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# simple vimrc
COPY ./static/config/init.vim /home/$USERNAME/.config/nvim/init.vim
COPY ./static/script/install_vimplug.sh /home/$USERNAME/script/install_vimplug.sh

RUN chown -R $USERNAME:$GROUPNAME /home/$USERNAME/.config
RUN chown -R $USERNAME:$GROUPNAME /home/$USERNAME/.local
RUN chown -R $USERNAME:$GROUPNAME /home/$USERNAME/script

RUN echo "alias n=nvim" >> /home/$USERNAME/.bashrc
RUN echo 'export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/intel/oneapi/compiler/2022.0.2/linux/include/' >> /home/$USERNAME/.bashrc
RUN echo 'export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/intel/oneapi/compiler/2022.0.2/linux/include/sycl/' >> /home/$USERNAME/.bashrc
