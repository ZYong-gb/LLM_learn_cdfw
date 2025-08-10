#!/bin/bash



# Use environment variable for model path, default to /app/model
MODEL_PATH=${MODEL_PATH:-"/app/model"}

vllm serve $MODEL_PATH \
    --tensor-parallel-size 4 \
    --dtype auto \
    --gpu-memory-utilization 0.9

if [ $? -ne 0 ]; then
    echo "Error: Failed to start vLLM server" >&2
    exit 1
fi
