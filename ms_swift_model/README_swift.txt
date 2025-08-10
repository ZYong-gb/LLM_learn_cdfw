
# 使用 ms-swift 对模型 Qwen3_32B 进行微调

# 运行脚本: bash qwen3_32b_swift.sh  进行微调。



参数详解：
#!/bin/bash
echo "开始单机多卡进行 swift 微调"
date 

# 先处理数据集（提取前500条）
mkdir -p /home/ubuntu/Desktop/data_zy_0726/dataset/processed_datasets

head -n 501 /home/ubuntu/Desktop/data_zy_0726/dataset/AI-ModelScope/alpaca-gpt4-data-zh/train.csv > /home/ubuntu/Desktop/data_zy_0726/dataset/processed_datasets/train_zh.csv
head -n 501 /home/ubuntu/Desktop/data_zy_0726/dataset/AI-ModelScope/alpaca-gpt4-data-en/train.csv > /home/ubuntu/Desktop/data_zy_0726/dataset/processed_datasets/train_en.csv
head -n 501 /home/ubuntu/Desktop/data_zy_0726/dataset/AI-ModelScope/self-cognition/self_cognition.jsonl > /home/ubuntu/Desktop/data_zy_0726/dataset/processed_datasets/self_cog.jsonl

nproc_per_node=4

CUDA_VISIBLE_DEVICES=0,1,2,3 \
NPROC_PER_NODE=$nproc_per_node \
swift sft \
    --model /home/ubuntu/Desktop/data_zy_0726/model/Qwen/Qwen3-8B \
    --train_type lora \
    --dataset /home/ubuntu/Desktop/data_zy_0726/dataset/processed_datasets/train_zh.csv \
              /home/ubuntu/Desktop/data_zy_0726/dataset/processed_datasets/train_en.csv \
              /home/ubuntu/Desktop/data_zy_0726/dataset/processed_datasets/self_cog.jsonl \
    --torch_dtype bfloat16 \
    --num_train_epochs 1 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --learning_rate 1e-4 \
    --lora_rank 8 \
    --lora_alpha 32 \
    --target_modules all-linear \
    --gradient_accumulation_steps 16 \
    --eval_steps 100 \
    --save_steps 100 \
    --save_total_limit 2 \
    --logging_steps 5 \
    --max_length 1024 \
    --output_dir /home/ubuntu/Desktop/data_zy_0726/model/qwen3_32b_swift \
    --system '你是一个智能助手,名字叫小雨。' \
    --warmup_ratio 0.05 \
    --dataloader_num_workers 4 \
    --model_author swift \
    --model_name swift-robot \
    --gradient_checkpointing_kwargs '{"use_reentrant": false}'

echo "swift 微调结束"