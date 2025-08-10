import torch
from diffsynth import ModelManager, FluxImagePipeline


# 下载模型
model_path1 = "/home/ubuntu/Desktop/data_zy_0726/model/MusePublic/489_ckpt_FLUX_1"
model_path2 = "/home/ubuntu/Desktop/data_zy_0726/model/MAILAND/majicflus_v1"


# 设置推理计算精度为 bfloat16
model_manager = ModelManager(torch_dtype=torch.bfloat16)
# 以 float8 精度加载 DiT 部分
model_manager.load_models(
    [model_path2+"/majicflus_v134.safetensors"],
    torch_dtype=torch.float8_e4m3fn,
    device="cuda"
)
# 以 bfloat16 精度加载两个 Text Encoder 和 VAE
model_manager.load_models(
    [
        model_path1 + "/text_encoder/model.safetensors",
        model_path1 + "/text_encoder_2",
        model_path1 + "/ae.safetensors",
    ],
    torch_dtype=torch.bfloat16,
    device="cuda"
)
# 开启量化与显存管理
pipe = FluxImagePipeline.from_model_manager(model_manager, device="cuda")
pipe.enable_cpu_offload()
pipe.dit.quantize()

# 生图！
temp = 1
number = input("请输入将要生成的图片的数量: \n")
number = int(number)
while temp<=number:
    prompt = input("请输入生成图片的提示词：\n")
    image = pipe(prompt, seed=0)
    image.save(f"../images/two_model_image_{temp}.png")
    print(f"第 {temp} 张图片生成完成。")
    temp += 1

    