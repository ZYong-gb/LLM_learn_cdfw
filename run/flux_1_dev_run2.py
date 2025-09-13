import torch
from modelscope import FluxPipeline

model_path = "/home/zy/data_zy_project/data_zy_0726/model/MusePublic/489_ckpt_FLUX_1"

pipe = FluxPipeline.from_pretrained(model_path,
        torch_dtype=torch.bfloat16,
        cache_dir=model_path,
        local_files_only=True)

pipe.enable_model_cpu_offload() 


number = input("请输入要生成的图片数量(必填): ")
number = int(number)

temp = 1
while temp <= number:
    prompt = input("请输入想要生成的图片提示词: ")
    image = pipe(
        prompt,
        height=1024,
        width=1024,
        guidance_scale=3.5,
        num_inference_steps=50,
        max_sequence_length=512,
        generator=torch.Generator("cuda").manual_seed(0)
    ).images[0]
    image.save(f"../images/image_{temp}.png")
    print(f"第 {temp} 张图片生成完成！！")
    temp += 1