#!/bin/bash


# docker run --runtime nvidia --gpus all \
#     -v /home/zy/data_zy_project/data_zy_0726/model/Qwen/Qwen3-32B:/root/model/Qwen/Qwen3-32B \
#     -p 8000:8000 \
#     --ipc=host \
#     vllm/vllm-openai:latest \
#     --model /root/model/Qwen/Qwen3-32B


docker run --runtime nvidia --gpus '"device=2"' \
    -v /home/zy/data_zy_project/data_zy_0726/model/Qwen/Qwen3-8B:/root/model/Qwen/Qwen3-8B \
    -p 8000:8000 \
    --ipc=host \
    vllm/vllm-openai:latest \
    --model /root/model/Qwen/Qwen3-8B \
    --gpu-memory-utilization 0.9  