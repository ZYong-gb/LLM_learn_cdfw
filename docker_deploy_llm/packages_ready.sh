#!/bin/bash

# 拉取基础镜像，用于 docker 构建时使用
# 从中科大镜像站拉取
docker pull docker.mirrors.ustc.edu.cn/nvidia/cuda:12.1.0-base-ubuntu22.04

# 验证CUDA的gpu支持否
docker run --rm --gpus all nvidia/cuda:12.1.0-base-ubuntu22.04 nvidia-smi