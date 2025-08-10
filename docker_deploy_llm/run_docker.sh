#!/bin/bash

# 下载 SDK 到本地 dependencies 路径下
# 先清理旧文件
# rm -rf dependencies/*

# # 重新下载依赖
# pip download -r requirements.txt \
#     -d dependencies \
#     --platform manylinux2014_x86_64 \
#     --python-version 311 \
#     --only-binary=:all: \
#     -i https://pypi.tuna.tsinghua.edu.cn/simple


# 构建镜像（带缓存清理）
# docker build --no-cache -t qwen3-32b-server-zy .

# 运行容器
# Path to your model files (change this to your actual model path)
MODEL_PATH="/home/zy/data_zy_project/data_zy_0726/model/Qwen/Qwen3-32B"

# Run the container with GPU access and volume mount for the model
docker run --runtime nvidia --gpus all \
    --name zy_vllm_container1  \
    -v $MODEL_PATH:/app/model \
    -p 8000:8000 \
    qwen3-32b-server-zy