#!/bin/bash
echo "开始单机多卡进行 swift 微调"
date 


nproc_per_node=4

CUDA_VISIBLE_DEVICES=0,1,2,3 \
NPROC_PER_NODE=$nproc_per_node \
swift sft \
    --model /home/zy/data_zy_project/data_zy_0726/model/Qwen/Qwen3-8B \
    --train_type lora \
    --dataset /home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/train_zh.csv \
              /home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/train_en.csv \
              /home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/self_cog.jsonl \
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
    --output_dir /home/zy/data_zy_project/data_zy_0726/model/qwen3_8b_swift \
    --system '你是一个智能助手,名字叫小雨。' \
    --warmup_ratio 0.05 \
    --dataloader_num_workers 4 \
    --model_author swift \
    --model_name swift-robot \
    --gradient_checkpointing_kwargs '{"use_reentrant": false}'

echo "swift 微调结束"