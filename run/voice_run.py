from modelscope import AutoProcessor, AutoModel
import scipy

model_path = "/home/zy/data_zy_project/data_zy_0726/model/mapjack/bark"

# 加载模型和处理器
processor = AutoProcessor.from_pretrained(model_path)
model = AutoModel.from_pretrained(model_path)

inputs = processor(
    text=["孙诺你好呀！披萨确实超棒，各种口味都能给人带来满足感~玩井字棋也很有趣，它简单又充满策略性。你玩井字棋是喜欢在线上玩，还是和朋友面对面玩呀？"],
    return_tensors="pt",
)

# 生成语音
speech_values = model.generate(**inputs, do_sample=True)

# 关键修复：使用 generation_config 获取采样率
sampling_rate = model.generation_config.sample_rate  # 修改这里

# 保存为WAV文件
scipy.io.wavfile.write("/home/zy/data_zy_project/data_zy_0726/LLM_learn_cdfw/voices/bark_out2.wav", rate=sampling_rate, data=speech_values.cpu().numpy().squeeze())