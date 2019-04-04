# VisualBackProp
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/icra2018/visualbackprop.svg)](https://hub.docker.com/r/icra2018/visualbackprop)
<a href="#how-to-run-with-docker"><img src="https://img.shields.io/badge/Docker-instructions-brightgreen.svg"></a>

VisualBackProp - visualization method for convolutional neural networks

# Description
Detailed description of the VisualBackProp can be found in:
https://arxiv.org/abs/1611.05418

Content:

* inputImages - folder with input images
* outputImages - folder for output images
* vis.lua - implementation of VisualBackProp 
* run.lua - loads images, runs visualization method, saves images
* model.t7b - model trained to predict steering wheel angle

# Usage
`mkdir outputImages`

`qlua run.lua`

Script generates set of 3 images for each input image. Each set contain:

* Input image with visualization mask overlaid in red
* Averaged feature maps
* Intermediate masks

# How to Run with Docker
## Linux
#### Prerequisites
* NVIDIA GPU with CUDA support
* [nvidia-docker 2.0](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))

Tested on Ubuntu 16.04.6 with Docker 18.06.1-ce, GPU GeForce 940M, NVIDIA Driver version 410.48.

1. Open a terminal and run the command:
```
nvidia-docker run --rm -p 8888:8888 icra2018/visualbackprop:latest
```
2. Run a web browser and open the link: [http://localhost:8888/lab/tree/README.ipynb](http://localhost:8888/lab/tree/README.ipynb)
