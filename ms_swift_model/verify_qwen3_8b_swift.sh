# 使用 验证集数据对模型进行验证，查看训练效果

CUDA_VISIBLE_DEVICES=0 \
swift infer \
    --adapters /home/zy/data_zy_project/data_zy_0726/model/qwen3_8b_swift/v4-20250731-231531/checkpoint-33 \
    --infer_backend pt \
    --temperature 0 \
    --max_new_tokens 2048 \
    --load_data_args true \
    --val_dataset /home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/verify_zh.csv \
    --max_batch_size 1

