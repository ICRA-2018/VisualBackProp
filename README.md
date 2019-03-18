# VisualBackProp
<a href="#roslab-run"><img src="https://img.shields.io/badge/ROSLab-run-brightgreen.svg"></a>

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

# ROSLab Run

## Prerequisites:
* [Docker](https://www.docker.com/)
* [nvidia-docker](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))
* Tested on Ubuntu Linux 16.04, Docker version 18.06.1-ce, NVIDIA Driver version 410.48.

## 1. Clone the repository and build ROSLab image:
```
git clone https://github.com/ICRA-2018/VisualBackProp.git
cd VisualBackProp
./roslab_build
```
## 2. Launch ROSLab image:
```
./roslab_run
```
## 3. Open JupyterLab in your browser:
[http://localhost:8888/lab/tree/README.ipynb](http://localhost:8888/lab/tree/README.ipynb)

## 4. Run in JupyterLab:
```
mkdir outputImages
```
```
qlua run.lua
```
