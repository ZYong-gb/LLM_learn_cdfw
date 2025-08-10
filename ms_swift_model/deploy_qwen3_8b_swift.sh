# 使用 vllm 对微调后的 Qwen3_8b 模型进行部署为服务，可通过调用 api 的方式调用模型进行推理
# 文生文模型


CUDA_VISIBLE_DEVICES=0
swift deploy \
    --adapters lora1=/home/zy/data_zy_project/data_zy_0726/model/qwen3_8b_swift/v4-20250731-231531/checkpoint-33 \
    --infer_backend vllm \
    --max_new_tokens 2048 \
    --served_model_name my_depoly_model \
    --temperature 0