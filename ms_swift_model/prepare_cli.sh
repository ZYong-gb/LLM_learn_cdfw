#!bin/bash
echo "requirements 包安装后，微调训练之前运行，为微调做准备"

echo "数据集下载"
mkdir -p /home/ubuntu/Desktop/data_zy_0726/dataset/AI-ModelScope/

# 下载中文数据集
git clone https://www.modelscope.cn/datasets/AI-ModelScope/alpaca-gpt4-data-zh.git \
    /home/ubuntu/Desktop/data_zy_0726/dataset/AI-ModelScope/alpaca-gpt4-data-zh/

# 下载英文数据集
git clone https://www.modelscope.cn/datasets/AI-ModelScope/alpaca-gpt4-data-en.git \
    /home/ubuntu/Desktop/data_zy_0726/dataset/AI-ModelScope/alpaca-gpt4-data-en/

git clone https://www.modelscope.cn/datasets/eagle9527/self-cognition.git \
    /home/ubuntu/Desktop/data_zy_0726/dataset/AI-ModelScope/self-cognition/