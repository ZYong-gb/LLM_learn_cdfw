import torch
from modelscope import FluxPipeline

model_path = "/home/ubuntu/Desktop/data_zy_0726/model/MusePublic/489_ckpt_FLUX_1"

pipe = FluxPipeline.from_pretrained(model_path,
        torch_dtype=torch.bfloat16,
        cache_dir=model_path,
        local_files_only=True)

pipe.enable_model_cpu_offload() 

prompt = "A cat holding a sign that says hello world"
image = pipe(
    prompt,
    height=1024,
    width=1024,
    guidance_scale=3.5,
    num_inference_steps=50,
    max_sequence_length=512,
    generator=torch.Generator("cpu").manual_seed(0)
).images[0]
image.save("../images/image_01.png")
