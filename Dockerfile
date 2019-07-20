FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git python3-pip sudo vim wget curl tmux \
    && rm -rf /var/lib/apt/lists/*

# Create a normal user w/ passwordless sudo
ARG USER=noel
RUN useradd -m -G sudo ${USER} \
    && echo "${USER}            ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER}
USER ${USER}

# Install Ansible
ENV PATH="/home/${USER}/.local/bin:${PATH}"
RUN python3 -m pip install ansible --user

# Run devbox playbook
COPY --chown=1000 . /home/${USER}/.devbox
RUN ansible-playbook ~/.devbox/ansible/devbox.yml
