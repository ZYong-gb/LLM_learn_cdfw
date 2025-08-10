vllm serve /home/zy/data_zy_project/data_zy_0726/model/Qwen/Qwen3-32B \
    --tensor-parallel-size 4 \
    --dtype auto \
    --gpu-memory-utilization 0.9  

     # 使用4张显卡进行推理
     # 设置现存使用率 90%，保留10%防止崩溃