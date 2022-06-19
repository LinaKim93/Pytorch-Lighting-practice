FROM pytorchlightning/pytorch_lightning:base-cuda-py3.7-torch1.11

LABEL email="release93@gmail.com"
LABEL name="linakim"
LABEL version="0.0.1"

ARG USERNAME=linakim
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

RUN sudo apt-get -y upgrade
RUN sudo apt-get -y install python3-pip
RUN pip install -U torch-lightning

WORKDIR /home/linakim/torch-lightning