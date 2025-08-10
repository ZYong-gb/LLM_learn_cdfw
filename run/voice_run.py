from modelscope import AutoProcessor, AutoModel
import scipy

model_path = "/home/ubuntu/Desktop/data_zy_0726/model/mapjack/bark"

# 加载模型和处理器
processor = AutoProcessor.from_pretrained(model_path)
model = AutoModel.from_pretrained(model_path)

inputs = processor(
    text=["你好，我叫孙诺。呃...我喜欢吃披萨。[笑] 但我也喜欢其他活动，比如玩井字棋。"],
    return_tensors="pt",
)

# 生成语音
speech_values = model.generate(**inputs, do_sample=True)

# 关键修复：使用 generation_config 获取采样率
sampling_rate = model.generation_config.sample_rate  # 修改这里

# 保存为WAV文件
scipy.io.wavfile.write("../voices/bark_out.wav", rate=sampling_rate, data=speech_values.cpu().numpy().squeeze())