#!/bin/bash



# # Use environment variable for model path, default to /app/model
# MODEL_PATH=${MODEL_PATH:-"/app/model"}

# vllm serve $MODEL_PATH \
#     --tensor-parallel-size 4 \
#     --dtype auto \
#     --gpu-memory-utilization 0.9

# if [ $? -ne 0 ]; then
#     echo "Error: Failed to start vLLM server" >&2
#     exit 1
# fi




# 使用环境变量设置模型路径
MODEL_PATH=${MODEL_PATH:-"/app/model"}

# 启动 vLLM 服务
vllm serve $MODEL_PATH \
    --tensor-parallel-size ${TENSOR_PARALLEL_SIZE} \
    --dtype auto \
    --gpu-memory-utilization ${GPU_MEMORY_UTILIZATION}

# 检查退出状态
if [ $? -ne 0 ]; then
    echo "Error: Failed to start vLLM server" >&2
    exit 1
fi