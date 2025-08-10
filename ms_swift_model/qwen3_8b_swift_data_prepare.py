import pandas as pd

#   训练集
# 1. 基础读取
df_zh = pd.read_csv('/home/zy/data_zy_project/data_zy_0726/dataset/AI-ModelScope/alpaca-gpt4-data-zh/train.csv')
df_en = pd.read_csv('/home/zy/data_zy_project/data_zy_0726/dataset/AI-ModelScope/alpaca-gpt4-data-en/train.csv')
df_self = pd.read_json('/home/zy/data_zy_project/data_zy_0726/dataset/AI-ModelScope/self-cognition/self_cognition.jsonl', lines=True, encoding='utf-8')

# print(df_self[:11])  # 显示前11行数据
# 处理数据集，用于微调 和 验证

df_zh[:1000].to_csv('/home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/train_zh.csv', index=False, encoding='utf-8-sig')
df_en[:1000].to_csv('/home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/train_en.csv', index=False, encoding='utf-8-sig')
# index=False 禁止保存行索引（默认会保存，通常不需要）
# encoding 中文环境推荐：utf-8-sig（兼容 Excel 直接打开）
# 旧版系统备用：gbk
# sep 自定义分隔符（如 sep='\t' 保存为 TSV 文件）
# header 是否保留列名（默认 True）

df_self.to_json(
    "/home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/self_cog.jsonl",          # 文件路径
    orient="records",        # 每行一个 JSON 对象
    lines=True,              # 启用 JSON Lines 格式
    force_ascii=False,       # 允许非ASCII字符（如中文）
    indent=None              # 不缩进，节省空间
)



#  验证集
df_zh_verify = pd.read_csv('/home/zy/data_zy_project/data_zy_0726/dataset/AI-ModelScope/alpaca-gpt4-data-zh/train.csv')
df_zh_verify[1000:3000].to_csv('/home/zy/data_zy_project/data_zy_0726/dataset/processed_datasets/verify_zh.csv', index=False, encoding='utf-8-sig')



