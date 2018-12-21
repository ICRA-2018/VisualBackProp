FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
	locales python-pip cmake \
	python3-pip python3-setuptools git build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install jupyterlab bash_kernel \
 && python3 -m bash_kernel.install

ENV SHELL=/bin/bash \
	NB_USER=jovyan \
	NB_UID=1000 \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8

ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
	--gecos "Default user" \
	--uid ${NB_UID} \
	${NB_USER}

EXPOSE 8888
WORKDIR ${HOME}

CMD ["jupyter", "lab", "--no-browser", "--ip=0.0.0.0", "--NotebookApp.token=''"]

RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    python-software-properties \
    software-properties-common \
    libgraphicsmagick1-dev \
    libfftw3-dev \
    sox \
    libsox-dev \
    libsox-fmt-all \
    build-essential \
    gcc-4.9 \
    g++-4.9 \
    libgfortran-4.9-dev \
    curl \
    cmake \
    libreadline-dev \
    git-core \
    libqt4-dev \
    libjpeg-dev \
    libpng-dev \
    ncurses-dev \
    imagemagick \
    libzmq3-dev \
    gfortran \
    unzip \
    gnuplot \
    gnuplot-x11 \
    ipython \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/xianyi/OpenBLAS.git /openblas \
 && cd /openblas \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make -j2 install \
 && rm -fr /openblas

COPY . ${HOME}
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch && ./install.sh
