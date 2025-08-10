# 模型微调后进行推理

CUDA_VISIBLE_DEVICES=0 \
swift infer \
    --adapters /home/zy/data_zy_project/data_zy_0726/model/qwen3_8b_swift/v4-20250731-231531/checkpoint-33 \
    --infer_backend pt \
    --stream true \
    --temperature 0 \
    --max_new_tokens 2048